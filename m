Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C695137627
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 19:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA25816C1;
	Fri, 10 Jan 2020 19:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA25816C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578681453;
	bh=4vFsPJi1mCsRHP45V4UsTStwdfkrQT9WN/ipJJ81R0U=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfJqWp88/GjGeQqFoUEq8gWGSRuyV9wgVd7PGzkVRlNdM9Pjma4hGDayMCC+oNisi
	 VALScZ07OqB7jU8jSs5XapLW9uZrc5DoaDWlv1Z3MF+3pXVG3XvMzz3yoLE03ABQQ+
	 1qZ0RcMGmgFFN6KIWBhSi7s8jEwWkRI6CfZJuvHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A88F80161;
	Fri, 10 Jan 2020 19:35:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED775F8010B; Fri, 10 Jan 2020 19:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 15DABF8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 19:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15DABF8010B
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578681343533937931-webhooks-bot@alsa-project.org>
References: <1578681343533937931-webhooks-bot@alsa-project.org>
Message-Id: <20200110183546.ED775F8010B@alsa1.perex.cz>
Date: Fri, 10 Jan 2020 19:35:46 +0100 (CET)
Subject: [alsa-devel] When storing settings which contain a [ or ],
	the setting is not quoted.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #22 was edited from Bertware:

I am using a Raspberry Pi 1 B+ with a Hifiberry DAC+ADC Pro HAT.
This HAT contains a PCM5122 Stereo DAC and an ADC.

 Now to the issue: The ADC has parameters such as `VINR1[SE]` and `VINR2[SE] + VINR1[SE]`. When using `alsactl store` or`alsactl restore`, restoring will fail due to an invalid file.

`ALSA lib conf.c:1887:(_snd_config_load_with_include) _toplevel_:354:30:Unexpected char`

This error points to the parameter `VINR1[SE]`, which is not surrounded by quotes. The other parameters, which also contain other special characters such as spaces, are surrounded by quotes.

An excerpt of the file is included below. This clearly illustrates which names were encapsulated between quotes.

```

control.28 {
                iface MIXER
                name 'ADC Right Capture Source'
                value VINR1[SE]
                comment {
                        access 'read write'
                        type ENUMERATED
                        count 1
                        item.0 'No Select'
                        item.1 VINR1[SE]
                        item.2 VINR2[SE]
                        item.3 'VINR2[SE] + VINR1[SE]'
                        item.4 VINR3[SE]
                        item.5 'VINR3[SE] + VINR1[SE]'
                        item.6 'VINR3[SE] + VINR2[SE]'
                        item.7 'VINR3[SE] + VINR2[SE] + VINR1[SE]'
                        item.8 VINR4[SE]
                        item.9 'VINR4[SE] + VINR1[SE]'
                        item.10 'VINR4[SE] + VINR2[SE]'
                        item.11 'VINR4[SE] + VINR2[SE] + VINR1[SE]'
                        item.12 'VINR4[SE] + VINR3[SE]'
                        item.13 'VINR4[SE] + VINR3[SE] + VINR1[SE]'
                        item.14 'VINR4[SE] + VINR3[SE] + VINR2[SE]'
                        item.15 'VINR4[SE] + VINR3[SE] + VINR2[SE] + VINR1[SE]'
                        item.16 '{VIN2P, VIN2M}[DIFF]'
                        item.17 '{VIN3P, VIN3M}[DIFF]'
                        item.18 '{VIN2P, VIN2M}[DIFF] + {VIN3P, VIN3M}[DIFF]'
                }
        }
```
Manually fixing this file by adding '' around the items which miss quotes fixes the issue, and allows restoring it.

**How this leads to alsa-lib and where the issue is located**

Creation of the output data and writing it to a file is handled by the save_state method in alsactl: https://github.com/alsa-project/alsa-utils/blob/master/alsactl/state.c#L1539
This code in turn calls snd_config_save in the alsa-lib project: https://github.com/alsa-project/alsa-lib/blob/b20b400e2f598c86abaf697d66396cecd49b3e14/src/conf.c#L3080
Then further to string_print: https://github.com/alsa-project/alsa-lib/blob/b20b400e2f598c86abaf697d66396cecd49b3e14/src/conf.c#L1508
And then in this loop which decides which characters need to be quoted: https://github.com/alsa-project/alsa-lib/blob/b20b400e2f598c86abaf697d66396cecd49b3e14/src/conf.c#L1523

**Proposed solution**
The characters `[` and `]` should be a reason to put text between quotes.
These characters should be added to the switch statement in print_string here:
https://github.com/alsa-project/alsa-lib/blob/b20b400e2f598c86abaf697d66396cecd49b3e14/src/conf.c#L1535

Regards,
Bert

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/22
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
