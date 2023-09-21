Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD647A94C6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B55EC0;
	Thu, 21 Sep 2023 15:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B55EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302898;
	bh=DkjE+1zNts+M88YvO/Vk9iwEM9UleRXKojvOEttqfRo=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gs98+U+F0vSXP7/xaMZlXNJf9BcA2DFznZAHaa71zSfqtalzXQOYMzj9I7IH9FqLW
	 qqIeUsFJjIjWM89r0+lmxV7G+P3xkmaG/9nZZhm8aF+OcVdWQ2O6KPQSLy8oNhy5h1
	 sKiBGA3pf2boUV5+IL/0uSCNvnMAO8rfWEOdKqxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC22BF805E0; Thu, 21 Sep 2023 15:24:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B35F80579;
	Thu, 21 Sep 2023 15:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98D34F8025A; Thu, 21 Sep 2023 08:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB783F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB783F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CNfFsMeN
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so9685711fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695279520; x=1695884320;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ24ZdmC3+/lt3MKiQj6DVhfuE70M1LQ8RFFhKZZS5Q=;
        b=CNfFsMeNK0+3LDZseES5rBDmldrhspdrtEu9WkXCilbpWTb+zsL3RXNvfvWyIdO98H
         +biGnbB5kIH3OT77ccgHc0+O6nK42PC5MiY6ib6lKZzdpyLxPpSyCpEmW3MZYHS2JBRy
         hrEuOxrrTlL2usgbkc649pJH31jG99qUzCwlW24x/VuGPZOqTUxccrNrAyUbgDH3jbU5
         jqn6/HtI/xX3qLvN3WPcJH4KJgInFBaEoW4D2YTUYGQZopQufKyFaFRXJtE3MNCJMYus
         uI6UNbBy0CuGT1JpJGybk2Z/Ejq8e9Qg3hxDixjrKoh5LBDG5s9fwnCuDtBbXwFx+mG+
         bLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695279520; x=1695884320;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ24ZdmC3+/lt3MKiQj6DVhfuE70M1LQ8RFFhKZZS5Q=;
        b=FM1aXF3WMMKcDfe2NnIAJ6Mld9U+OnjGIXOtygidssHpwQBPGYsekuz/9XwCYevG/Q
         FRVi2IgzYFTjPb46R9i6C6u0mwA9chPNTMWaiDt1iSKXJCKuns4AxdCDDTun6bod43YV
         XwxXmrxhsy0I4rgpITRkeqsj+v4rDkYkU8VCHsM6TAx3qkTlogy2wa15X9qGsHG22S4p
         gFVFbOy6al8owG1jdSrXWVu5gy92ZW9a+a6OxGQx9cP45fd1mkoHtYQfA+It0BdnkQSU
         oaMoquvZfuGutTJ93uHEpj8gaRnbWCTowXAl5rw2fDb6RhB+4rE8DGMjIveqniWkrovF
         vS0w==
X-Gm-Message-State: AOJu0YzvbPOd19WY6caLosbySSmPMh0rMexIvGPfaV7na3eVVkbRsRjV
	RyCidC+SWR6eficEVU11+b8=
X-Google-Smtp-Source: 
 AGHT+IGs0qtNZWOH6DxXm1gSJbUU3dEbdkMCJibtY+QMhmhM5rkk01C+bRPoVqBat+5lBt7WZgRGKw==
X-Received: by 2002:a05:6512:110e:b0:503:7dd:7ebc with SMTP id
 l14-20020a056512110e00b0050307dd7ebcmr5159929lfg.18.1695279520238;
        Wed, 20 Sep 2023 23:58:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:7c80:b060::49? ([2600:1700:7c80:b060::49])
        by smtp.gmail.com with ESMTPSA id
 8-20020ac24848000000b00500a467914esm167556lfy.38.2023.09.20.23.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 23:58:39 -0700 (PDT)
Message-ID: <348823a2-af40-42d5-af30-dc00eaf1d90a@gmail.com>
Date: Thu, 21 Sep 2023 02:58:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
From: Abelardo Ricart <aricart@gmail.com>
Subject: [PATCHv2] ALSA: hda/realtek: Add quirk for ASUS ROG G533Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: aricart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XC6HC5YPBIOID6ZLDFWLZ6SP266PSRLB
X-Message-ID-Hash: XC6HC5YPBIOID6ZLDFWLZ6SP266PSRLB
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:24:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XC6HC5YPBIOID6ZLDFWLZ6SP266PSRLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The same quirk applied to the ASUS G533Z is also applicable to the ASUS
G533Q (of which I am an owner and have thus tested). Resubmitted for
e-mail formatting issue.

Signed-off-by: Abelardo Ricart <aricart@gmail.com>
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcffd8..7bb3c1e05bf2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9781,6 +9781,7 @@ static const struct snd_pci_quirk 
alc269_fixup_tbl[] = {
SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", 
ALC285_FIXUP_ASUS_HEADSET_MIC),
SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook 
UX31A",ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", 
ALC285_FIXUP_ASUS_HEADSET_MIC),
+ SND_PCI_QUIRK(0x1043, 0x1602, "ASUS ROG Strix G15 
(G533Q)",ALC285_FIXUP_ASUS_G533Z_PINS),
SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", 
ALC287_FIXUP_CS35L41_I2C_2),
SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
