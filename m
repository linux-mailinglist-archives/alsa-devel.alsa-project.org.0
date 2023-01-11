Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04C667A41
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:04:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9901A92F0;
	Thu, 12 Jan 2023 17:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9901A92F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539448;
	bh=LBE/XFszLAhYkzy/9N5kRKrqi9XPyCBUQIW8gZBFmrk=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VXZiC1HM3CTaoZx/JYt1Mt38uCThim6Kfb3zGTQHpDvjTILWFbuAcvR4D/p3P4AK7
	 5WFExii3ekGqyN+RzdL0y7dHvvwykszcZ32pYyfk+Yi91CLVJYlJkYyjm1RLSgY01h
	 F/JlFox7tyKT5v7iiV3EDvjXbyhoEis8HwzrPvyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E982F805A0;
	Thu, 12 Jan 2023 16:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E08C8F803DC; Wed, 11 Jan 2023 16:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E823BF8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 16:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E823BF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U0QibaRA
Received: by mail-qt1-x830.google.com with SMTP id bp44so14197998qtb.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mVbhM9DNyV2jQIegc8jHBnPMqXbVMUIZxNuIpUdoJgM=;
 b=U0QibaRA8bNJbPgD9cI8P/1/BUMhkmX/ePcRktD5uVuKkNnZqQ/Wa/ZiM1kREOXFpn
 OHrsWLsEtT9PDbpRKHD0fLgVJCghXKCXwCV1+ogxKbnwMVMrJGdnIUm3/40yNL/FubuG
 VwMdCxecjQCfbcqYo05cTpqNrKkbe8u8pUygyeAF/huL+nF1CJpTtF9OZWW3hV+DDllu
 Q6QN5LsqZfJ4701Oc+JM1j1zzolxtmJj+L5c09FQavPjHF6FzMnRAuIUcFdwxUd1CPBR
 yL9WB8MFlUrUyfVGv27wcbaogHDB0HUK+4XONjoaFdYQubbsE7Ut/odP+AhH0unfoWWV
 N/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVbhM9DNyV2jQIegc8jHBnPMqXbVMUIZxNuIpUdoJgM=;
 b=VnNSad1zLOO8XYbtgIofD2dMBnA/t+G0Mu+SlyD1IlxHJTgqBKwzXjsvyaH7OVF8UK
 95f1M2kho2ADcZ1nWJj8nN2AJbzrz9iTuGAbZsvaCkok6JcDfeyoWgwJGqxXQDo2aba3
 H4+svWjl3QDZfTryC085yShnCfNK+L8eH++T++SQoxzeNOmwmQh2UnL4WptFJfinUUxc
 y9Xg8/1TzyfD6fMG/pjxuHYdwcO8skU35HnJKs68OHNnLlKYK00ajS3jtT4W6S9vf6MS
 hbd4RSfN/+3TfN3H64nrfuzwH/COjLRKgJba5emuBiReqwIpkFhtPUSXZHi/xEuTuVVG
 gdIQ==
X-Gm-Message-State: AFqh2kq0d8A2SjVkVrOs/2aGcSvfP+acsacNdViEddQSH/MPyw/t+39v
 +jrc1wo9ilEtXD8y8tqhDhw=
X-Google-Smtp-Source: AMrXdXvrvo18EgKvN9HAw3iQVascb3AHvRXSav2ZSw4oyr5DZysdWnPOX734BqI5V/ktXJ/bDhmaKg==
X-Received: by 2002:ac8:4811:0:b0:3b0:5068:6d63 with SMTP id
 g17-20020ac84811000000b003b050686d63mr5350799qtq.66.1673452714968; 
 Wed, 11 Jan 2023 07:58:34 -0800 (PST)
Received: from ?IPv6:2601:14d:4e80:336e:6940:faac:fba5:1dee?
 ([2601:14d:4e80:336e:6940:faac:fba5:1dee])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac86bc3000000b003ab7aee56a0sm7731725qtt.39.2023.01.11.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:58:34 -0800 (PST)
Message-ID: <392d72f2f86bebd56b072431ec0199aaaa5daad6.camel@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add OMEN by HP Gaming Laptop 16z-n000 into
 DMI table
From: Joseph Hunkeler <jhunkeler@gmail.com>
To: Syed.SabaKareem@amd.com
Date: Wed, 11 Jan 2023 10:58:33 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Jan 2023 16:59:42 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, mario.limonciello@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adding support for the HP Omen 16z-n000 laptop; this enables the internal
microphone.

Signed-off-by: Joseph Hunkeler <jhunkeler@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1f0b5527c594..32b61189d653 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -220,6 +220,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
 		}
 	},
+	{
+		.driver_data =3D &acp6x_card,
+		.matches =3D {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
+		}
+	},
 	{}
 };
=20
--=20
2.39.0


