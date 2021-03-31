Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05A350325
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 17:19:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371FA1682;
	Wed, 31 Mar 2021 17:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371FA1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617203948;
	bh=Wz6YRD31GY7ekYPyNVS1Ajx5rOZ84lZWzIfZFeXkJGI=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XFjjJOnYN4c/Ptn/mtlYmtvd3gi4Vdg6SR58S2IBpHcZfw/8V5lnVAGs9Gu/KWNXG
	 BXpOJEiXSRL3uIELsITPXQiH6Xn0+V32EWKm2pZ8+Mqyo+oOfxdwkUxOGvqyn+RKvg
	 d65eZc/rP3bw6LN4X5XeLi12sAm6NEpG5OJHHgkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 621D0F8013C;
	Wed, 31 Mar 2021 17:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 007E1F80166; Wed, 31 Mar 2021 17:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97EE9F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 17:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EE9F8013C
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lRcay-0003ue-RA; Wed, 31 Mar 2021 15:17:24 +0000
To: Jaroslav Kysela <perex@perex.cz>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: ALSA: control - add layer registration routines
Message-ID: <96e9bd5c-c8db-0db8-b393-fbf4a047dc80@canonical.com>
Date: Wed, 31 Mar 2021 16:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

Hi,

Static analysis on linux-next with Coverity has detected a potential
issue in the following commit:

commit 3f0638a0333bfdd0549985aa620f2ab69737af47
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Wed Mar 17 18:29:41 2021 +0100

    ALSA: control - add layer registration routines

The static analysis is as follows:

2072 void snd_ctl_disconnect_layer(struct snd_ctl_layer_ops *lops)
2073 {
2074        struct snd_ctl_layer_ops *lops2, *prev_lops2;
2075
2076        down_write(&snd_ctl_layer_rwsem);

    assignment: Assigning: prev_lops2 = NULL.

2077        for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2
= lops2->next)
2078                if (lops2 == lops) {

    null: At condition prev_lops2, the value of prev_lops2 must be NULL.
    dead_error_condition: The condition !prev_lops2 must be true.

2079                        if (!prev_lops2)
2080                                snd_ctl_layer = lops->next;
2081                        else

    'Constant' variable guards dead code (DEADCODE) dead_error_line:
    Execution cannot reach this statement: prev_lops2->next = lops->next;.
    Local variable prev_lops2 is assigned only once, to a constant
value, making it effectively constant throughout its scope. If this is
not the intent, examine the logic to see if there is a missing
assignment that would make prev_lops2 not remain constant.

2082                                prev_lops2->next = lops->next;
2083                        break;
2084                }
2085        up_write(&snd_ctl_layer_rwsem);
2086 }

I couldn't quite figure out the original intent of the prev_lops use, so
I'd thought I'd report this issue as the code does look incorrect.

Colin
