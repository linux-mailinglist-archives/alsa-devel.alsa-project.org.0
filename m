Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46036B107B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 18:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA80185C;
	Wed,  8 Mar 2023 18:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA80185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678298125;
	bh=zs0UM8kM2VnC2EAMlxdhs+9Wg86DimtKYhjwLouXb0w=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LOJgIUy/7aT6uURImftwZFLtIdOHhcFj+sEHO1zcbcADmF+00Ez2qIZDWpa+n8QgH
	 9ZtoYvnWRCJ2BKkxzHcHOZoFBR7vfpRhmvk3zA6ooHon95zSWE9kdw54PIPcuORV74
	 A3occvNCy5IFUA3zeBCpPXVrr3hX2+d653vXi/dQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAF4F804B1;
	Wed,  8 Mar 2023 18:53:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A174F80431; Wed,  8 Mar 2023 14:04:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FC99F80093
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC99F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=phI9E6E+
Received: by mail-ed1-x532.google.com with SMTP id ec29so34569227edb.6
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Mar 2023 05:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678280639;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zs0UM8kM2VnC2EAMlxdhs+9Wg86DimtKYhjwLouXb0w=;
        b=phI9E6E+6NGntYmcjDEaftMqtjJ3KQXg966Z6kvp9OWhYYOdJadiRO3U7J8+NH/ix9
         VV+VugQFAc2Vl04g84B/J4Bb44ibJqWmiu1rBp31KbUvWUw60a9q7lrITgVucTksu8oc
         7sr9C+DUxF5tKUudh2xq75LYqziavUsjqLmlWz62k+nN528NzxXIps/sNGKPppTYdZMl
         EzzxXWRNn7YBjCbH8l2vkCqHMsCUVgJAfA9XnBkxBm8Zgee9uBa9F+4tKISmw2gIT5po
         6SDN9B2jRrjWDrimAFCgGGlUikQCHXI2pVQl7+D5waqvvPAqZIid0++6S78iN3iPlT66
         HzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280639;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zs0UM8kM2VnC2EAMlxdhs+9Wg86DimtKYhjwLouXb0w=;
        b=Cc4f2wcAmSHAiXZseDXmKHx6wUj+tkd9kVvCsFTZriFp4gFSNL8M6ytQ5SDhp5L+v0
         354UTNpArG7zr51WFhwdLUd/ftWAE1f2r0SgvLP0J1bgTe0zL3spydXsePDsqiIeHR5d
         IDOzy1beESsRe0ZDpPz9sX7DPJEGeXbYGf3YgxCYU0RKIIyyWdDeBbKX7Xw0WfJSVqmT
         LYNnAiclVRRDZkVYx9dgwMuhHGdIh5kbk3JT+WScQN6eFJpeNFpabVOp4u/AFc/pQJoC
         XZfG4Abmse0/zsrfhYSPx/A5wuXpdcYVsnLwoo+5c6m3etfZ26bseHxlYbjC7xADL2Wn
         T/WQ==
X-Gm-Message-State: AO0yUKXljiZAEOdI7v8PDMgXUjP2aNlW3Jcx8xMeqGptTSpx3kmNy4P5
	xvhc2Ih2xdiC+aghr/TL0Ls=
X-Google-Smtp-Source: 
 AK7set+25e0jiz/QfBLhshopEKwFYJQZdMjPeDw15rvcubhtLK1wub6a7200Hu9ZmXQIk7BdoxUBNQ==
X-Received: by 2002:a17:906:db05:b0:889:5686:486a with SMTP id
 xj5-20020a170906db0500b008895686486amr22406068ejb.30.1678280639119;
        Wed, 08 Mar 2023 05:03:59 -0800 (PST)
Received: from [127.0.0.1] ([46.211.69.230])
        by smtp.gmail.com with ESMTPSA id
 u2-20020a170906c40200b008e2dfc6382asm7445708ejz.125.2023.03.08.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:03:58 -0800 (PST)
Date: Wed, 08 Mar 2023 15:03:57 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_7/8=5D_dt-bindings=3A_sound=3A?=
 =?US-ASCII?Q?_nvidia=2Ctegra-audio=3A_add_MAX9808x_CODEC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
References: <20230308073502.5421-1-clamor95@gmail.com>
 <20230308073502.5421-8-clamor95@gmail.com>
 <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
Message-ID: <915E75D9-8D29-4A72-9E53-841D5A420BAB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IFF6ZEIZV64I7UV4EXJT7TRQQD77AY67
X-Message-ID-Hash: IFF6ZEIZV64I7UV4EXJT7TRQQD77AY67
X-Mailman-Approved-At: Wed, 08 Mar 2023 17:53:45 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFF6ZEIZV64I7UV4EXJT7TRQQD77AY67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



8 =D0=B1=D0=B5=D1=80=D0=B5=D0=B7=D0=BD=D1=8F 2023 =D1=80=2E 15:02:28 GMT+0=
2:00, Mark Brown <broonie@kernel=2Eorg> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Wed, Mar 08, 2023 at 09:35:01AM +0200, Svyatoslav Ryhel wrote:
>> Add dt-binding for MAX9808x CODEC=2E
>
>This is adding a binding for a machine driver with these CODECs, not for
>the CODEC itself=2E

Fair, I will update name in v3
