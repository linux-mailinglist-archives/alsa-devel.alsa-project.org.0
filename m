Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5A478AE2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 13:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1BE2821;
	Fri, 17 Dec 2021 13:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1BE2821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639742856;
	bh=a0xC4x24TLVvFzFNTSl2u8FMc9MsmzhcBR2UnHkxEDM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhwzrO4wQjLHQGNPcadwPBkTKPZgtIA1NKsL3euH5GkSpojaZhMKEoYrSaFKbGTV8
	 bZ+2HckuPEQaM6CdqydiaUb4uz5tfHD+mvLzvmO3IZtqemPMlQrMvpFQqR1+jUrfNP
	 j8EPImR/5VprYyvKadX5LaCldPTxMQbgnQMOA8WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2AEF800F4;
	Fri, 17 Dec 2021 13:06:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35764F8014D; Fri, 17 Dec 2021 13:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B55DAF800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 13:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B55DAF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iqvPkpSb"
Received: by mail-lf1-x12f.google.com with SMTP id z7so4067097lfi.11
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDG0QRu1oWME9x0G+hGYpYXqzKBkpeCRyLSLI3ohny0=;
 b=iqvPkpSb+gCcK4T6PxilBYWAPmZ4umzvjmZTiUA2GzJiNCbdbpDQW7BOHM8rcgZjAo
 nB9iy+VMcbaD4X1E8F+gq4cUKLbRWjbPqZtvx1A5f4PmhS+nrLGRagpJr/j6fGvVNwr3
 l0wvENro/wryUGvzVfCF0dXc8b+ue8WLPg2EH6ofY43Cowi7QepRdxSu2rex9m1ltn5v
 EL6BXXFNaSlItrQE3K/SHZa5l28qlV5L9oS1HMPdI6E4ZqjMcFeRT9IioICALFlQEeAh
 SFJNF0zoZhgkPcOTkJLejvsbFPLcgSjw8nLLfyC9xmd0HGfJkGNRVipE9bnUgrIbX1ON
 SvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDG0QRu1oWME9x0G+hGYpYXqzKBkpeCRyLSLI3ohny0=;
 b=iz3/+piG4GCcC9W5rIGf5f+VEBNwIvdREVJwb7TrMJwwpobkEqn/WlKUenBd0lMYJ4
 RMkfcG50dv/HIxoA7Im6xzDXoYZtIl4DqslGLUcn2jkiZxkiUwxPvpv+cn+pB0s/FLSS
 rBmwMft2aMb7aboQSew/5N0aH9nL1Pu9HZdeCxi++8bqelp6gxb7qLcjVLWt2hWZJaaE
 TWHXgqcTKa8CHH3SSyCiQL2ireJHA15sKDfr2ijsi7BeiJbjBW02h1UHELrr8yAGyQvZ
 I3ySboDy0NuUPK+Gh0kNG6jfxaLOTEPe4Z1QyjsBQWVTyz7Af2Cl4NUSqqtB2ISQFcqG
 Oh7w==
X-Gm-Message-State: AOAM531r6z1p4YSwlS1JjmQyXMLF8vQfz1UqEj1TmxHJKKXDA4WqMx64
 JS++zddfkMbU7K/qAO/ageQ=
X-Google-Smtp-Source: ABdhPJzyAlxm9pnGeQ6YUFxsstA4V0G49vMUGYXzMsoPQUA1vN54MupqFmFaGUeFh/0+RT89Nyha9g==
X-Received: by 2002:a19:c3d5:: with SMTP id t204mr2630608lff.303.1639742778557; 
 Fri, 17 Dec 2021 04:06:18 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id t3sm1000266lfe.65.2021.12.17.04.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 04:06:17 -0800 (PST)
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
 <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com> <Ybx8XdLGGiQsNMTq@orome>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <36972e00-0eb9-acb7-d537-3b9a4b53386d@gmail.com>
Date: Fri, 17 Dec 2021 15:06:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybx8XdLGGiQsNMTq@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

17.12.2021 15:02, Thierry Reding пишет:
> On Fri, Dec 17, 2021 at 02:55:48PM +0300, Dmitry Osipenko wrote:
>> 17.12.2021 14:12, Mark Brown пишет:
>>> On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
>>>> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
>>>>> Document new optional sound-dai-cells property of HDMI node. This node will
>>>>> be used as endpoint of HDMI sound DAI graph.
>>>
>>>> It's probably best for this to go through ASoC along with the other
>>>> audio-related bindings.
>>>
>>>> Alternatively, I've just sent out a patch that converts the host1x
>>>> bindings to json-schema, so I could work this into that as well.
>>>
>>> It doesn't apply to the ASoC tree for whatever reason so probably best
>>> to roll it in with those JSON updates.
>>>
>>
>> This hos1tx binding patch indeed will conflict with the Thierry's patch.
>>
>> Thierry, will you be able to take the binding patches into the Tegra
>> tree and resolve all those hos1tx binding conflicts there?
> 
> Yes, I'll resolve all of those conflicts in the Tegra tree.

Thank you!

Mark, then you may apply patches 5-13 to ASoC on top of the Vinod's
branch, skipping patch #6. Thanks in advance!
