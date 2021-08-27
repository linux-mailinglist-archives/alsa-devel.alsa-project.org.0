Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DDF3F93B5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 06:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B606B16CE;
	Fri, 27 Aug 2021 06:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B606B16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630038720;
	bh=rNchozNuilrT3olVmGaUMKW4IELn8N8SXq+zhL2DOuI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJGy+Rov29Ep97ua4uVlameanj85qYRDY4Jp9MXKxbta3qMScF7xIUrlXEu8CjKiC
	 oJlUIha2Zkaq2KBnSK0n+z1RRKz+lK/1qHri+tKoxa5wj8P2c34xRBn3QbYQYl0ivc
	 /AkWDG7TecVvZszpcv6Pu7KWh5UA0WqUPxbIDelg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E592F80054;
	Fri, 27 Aug 2021 06:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923C2F80129; Fri, 27 Aug 2021 06:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 33209F80054
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 06:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33209F80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630038628002897024-webhooks-bot@alsa-project.org>
References: <1630038628002897024-webhooks-bot@alsa-project.org>
Subject: No cards found in 1.2.5
Message-Id: <20210827043035.923C2F80129@alsa1.perex.cz>
Date: Fri, 27 Aug 2021 06:30:35 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #111 was opened from Tooniis:

On 1.2.4:
```
$ alsaucm listcards
  0: HDA-Intel
  1: SOF
  2: bdw-rt5677
  3: broadwell-rt286
  4: broxton-rt298
  5: bytcht-cx2072x
  6: bytcht-es8316
  7: bytcr-rt5640
  8: bytcr-rt5651
  9: cht-bsw-rt5672
  10: chtmax98090
  11: chtnau8824
    chtnau8824 internal card
  12: chtrt5645
    Intel SoC Audio Device
  13: chtrt5650
    Intel SoC Audio Device
  14: hda-dsp
  15: kblrt5660
  16: skylake-rt286
  17: sof-hda-dsp
  18: sof-soundwire
```
On 1.2.5:
```
$ alsaucm listcards
  list is empty
```
My card's config (snd-soc-apq8096, using DB820c config) isn't being loaded on 1.2.5 as a result and I get no sound. Note that in both cases above, alsa-ucm-conf and alsa-lib are of the same version; as mixing versions causes some other errors (lack of conf.virt.d on alsa-lib 1.2.5 alsa-ucm-conf 1.2.4, and invalid syntax 4 on alsa-lib 1.2.4 with alsa-ucm-conf 1.2.5)

Using Arch Linux ARM.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/111
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
