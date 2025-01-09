Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB0A07843
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2025 14:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4B21603C7;
	Thu,  9 Jan 2025 14:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4B21603C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736430970;
	bh=YhAssIqrn7Ns89+JbNOE/V+1U75YmBJ0I5N/O8VrWXo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kVcZPwAkvbdOcRSSyH8Ll6weNMe00Ge45IP0bMYLYSmsAusPXy4VUnvWBHkF1IXFs
	 RIK3DwXqLc2c+5zmTXV0ynJdbFVgPzGWS8sjgG2RUAMKBKFCpjU0Byav7AHBvmMwV3
	 VfyiMdZErVVi1KlXzugqwvaMeKbWGaXbW3MnK1H4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8779F805BA; Thu,  9 Jan 2025 14:55:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 897AEF805B2;
	Thu,  9 Jan 2025 14:55:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3D60F804B2; Thu,  9 Jan 2025 14:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A20DDF80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2025 14:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20DDF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1736430930061546326-webhooks-bot@alsa-project.org>
References: <1736430930061546326-webhooks-bot@alsa-project.org>
Subject: alsactl info fails with exit code 25
Message-Id: <20250109135532.C3D60F804B2@alsa1.perex.cz>
Date: Thu,  9 Jan 2025 14:55:32 +0100 (CET)
Message-ID-Hash: 3I6YS6NKCNXM2FPYAFAOH3NZ2MA4Q3ES
X-Message-ID-Hash: 3I6YS6NKCNXM2FPYAFAOH3NZ2MA4Q3ES
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I6YS6NKCNXM2FPYAFAOH3NZ2MA4Q3ES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #287 was opened from z-s-e:

Here is the output of running alsactl info on my machine:
```
$ alsactl info 0
#
# Sound card
#
- card: 0
  id: Generic
  name: HD-Audio Generic
  longname: HD-Audio Generic at 0xb88c8000 irq 87
  driver_name: HDA-Intel
  mixer_name: ATI R6xx HDMI
  components: HDA:1002aa01,00aa0100,00100800
  controls_count: 15
  pcm:
    - stream: PLAYBACK
      devices:
        - device: 3
          id: HDMI 0
          name: G246HYL
          subdevices:
            - subdevice: 0
              name: subdevice #0
        - device: 7
          id: HDMI 1
          name: HDMI 1
          subdevices:
            - subdevice: 0
              name: subdevice #0
alsactl: rawmidi_device_list:105: snd_ctl_rawmidi_next_device
$ echo $?
25
```
Apparently it fails when trying to enumerate raw midi devices. I don't think this is supposed to happen, right?

alsa-info for reference:  [alsa-info.txt](https://github.com/user-attachments/files/18362369/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/287
Repository URL: https://github.com/alsa-project/alsa-utils
