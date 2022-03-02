Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E64CADC0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 19:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B8E1F1C;
	Wed,  2 Mar 2022 19:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B8E1F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646246617;
	bh=8R0nKDX8VFUi9Eif+gH82Eu1NIxS62zd18TarYebzpQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9rWObzSs2ZT39Jze2eUjobDZMoqlxK3mMZoZzGutubH4bg0r5wHaZPmTnYm8iqW9
	 AghOnOwfcCw1pqeyd26qwZJkLO2MS9dbGnpdQKpV5IfM3/MkmXLIKBTONtyHOD9uyE
	 RIlnAwIJ8EKd474T56X+bbyeQ1BAeXFyaUp3Z1k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60FB4F8027D;
	Wed,  2 Mar 2022 19:42:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 131B1F801D5; Wed,  2 Mar 2022 19:42:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 88ADBF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 19:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88ADBF80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1646246543868125916-webhooks-bot@alsa-project.org>
References: <1646246543868125916-webhooks-bot@alsa-project.org>
Subject: Issue in pcm_dsnoop.c in alsa-lib
Message-Id: <20220302184227.131B1F801D5@alsa1.perex.cz>
Date: Wed,  2 Mar 2022 19:42:27 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #213 was edited from TE-N-ShengjiuWang:

Hi Takashi Iwai, Jaroslav Kysela

We encountered an issue in the pcm_dsnoop use case, could you please help to have a look? 

Issue description:
With two instances for dsnoop type device running in parallel, after suspend/resume,  one of the instances will be hung in memcpy because the very large copy size is obtained.

```
#3 0x0000ffffa78d5098 in snd_pcm_dsnoop_sync_ptr (pcm=0xaaab06563da0)
at pcm_dsnoop.c:158
dsnoop = 0xaaab06563c20
slave_hw_ptr = 64
old_slave_hw_ptr = 533120
avail = 187651522444320
```

   Reason analysis: 
   The root cause that I analysis is that after suspend/resume,  one instance will get the SND_PCM_STATE_SUSPENDED state from slave pcm device,   then it will do snd_pcm_prepare() and snd_pcm_start(),  which will reset the dsnoop->slave_hw_ptr and the hw_ptr of slave pcm device,  then the state of this instance is correct.  But another instance may not get the SND_PCM_STATE_SUSPENDED state from slave pcm device because slave device may have been recovered by first instance,  so the dsnoop->slave_hw_ptr is not reset.  but because hw_ptr of slave pcm device has been reset,  so there will be a very large "avail" size. 

   Solution:
   I didn't come up with a fix for this issue,  seems there is no easy way to let another instance know this case and reset the  dsnoop->slave_hw_ptr,  could you please help?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/213
Repository URL: https://github.com/alsa-project/alsa-lib
