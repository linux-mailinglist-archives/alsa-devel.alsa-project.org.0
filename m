Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711946BAA1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 13:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C208B2406;
	Tue,  7 Dec 2021 13:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C208B2406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638878622;
	bh=1xFHGlGvi/iscr25VoSIYw7yhK6cAvVmto4Yfd+Vt9I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHfbmX0oA6oL0iWLe8ekjgJ21txc9wOugScZFfSzhpEzALWyu5UsrUAHuwECXhgfB
	 bGRBsujE5iWFx/aPOowMvBISa1TI12ooZTZtmZ/5z18jZTA5hgGPay5h1jnk/gIplF
	 9aeE0eHsg/7kgBUQx1gTcIzK60aUXb3Fhu2zoFew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C08F8032B;
	Tue,  7 Dec 2021 13:02:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C17F8028D; Tue,  7 Dec 2021 13:02:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0738CF80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 13:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0738CF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GqsVf1hN"
Received: by mail-lj1-x230.google.com with SMTP id 13so26888393ljj.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 04:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r9fkipqnPp4f5GIDB2CeCpczHVdjwOS7jyMrYOGJkF0=;
 b=GqsVf1hNAe43Bt6PyvC0QWChB1UjYKkxYX9URxZLfpdXvzC6fMLwXnx71FOfonXyt5
 F7zQlK9GPRC+MFH2s0yllhIN9t/Ss3r29tEeGKbHSDqxVRhx+vBR9Oc2dJuDAoAt3eQZ
 2oQTy6DVwGjkjZw/ZG82kHwPpvg9AWdFOm/EYJ8HAdzmFrAt925lkQWKzRlb05B+zZj3
 9Ss6dcp3JpKy1o3OxOxPZLC9KAlrruzmklV39eyCRFHOUahIRUV8DznZZxtx2w6R5L5x
 QuLumVQxniEJq0tj5sdj7UE34yRpeqRy59debQkWFGCNpzhBwl2W3HHl+eg5RbMqZ5/b
 qxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r9fkipqnPp4f5GIDB2CeCpczHVdjwOS7jyMrYOGJkF0=;
 b=BCyIjcNVDDOpmP4QkquAxm0uO0uKPfjUV7G2Hyzf+UEzP9yn+cmreCnuPImyeIi+jg
 HdLw8XU0GFSYMAIB6F9u6T1sdKkOL3V9BzQZM/sY91bn9Kb/WHKsPcCNYcC95osSoZHG
 ocXM+cpNYDx5cJ0ezo4HVWGrtVv5ib5s/UeiLYw/V1s56rDViaSwgX0Ii0MLCXBqg9OL
 MZr8OtR9ByDODX2amZDsq285iE2pKg4rgo/Zhaa01dOp/C7COUYVspTQzAAppcyYZKu1
 0x8gHbY6rPpBrQVuIf2yDBz9QswqK8ycDbwWXe1k1lszkg9cNMYqLfpgF/GZHzs4ROh9
 jPsQ==
X-Gm-Message-State: AOAM531Zz6dWyyWIXwAAXdAMzKN+Pn70rNElMIXjfdwytUXWjpiv8/Tk
 BhhLDGcemzM9W9oLnm/PWX4=
X-Google-Smtp-Source: ABdhPJyQT9CYRiC9vZmuQJvr0YvSDl7dobRPVo6l6llkAAPAyU1myeVZ+7YuQSDslv8PspRPRDxvTQ==
X-Received: by 2002:a2e:8091:: with SMTP id i17mr42642170ljg.64.1638878536336; 
 Tue, 07 Dec 2021 04:02:16 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id k13sm1812530lfo.300.2021.12.07.04.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 04:02:15 -0800 (PST)
Subject: Re: [PATCH 2/3] dt-bindings: sound: tegra: Update HDA resets
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-3-git-send-email-spujar@nvidia.com>
 <13d20227-ec6b-03db-01dc-b4b00038a15c@gmail.com>
 <03a5094c-0c53-98ab-97cb-4b27ed1b7a38@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42161fd5-f3bb-a71d-710e-b7078e294a0d@gmail.com>
Date: Tue, 7 Dec 2021 15:02:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <03a5094c-0c53-98ab-97cb-4b27ed1b7a38@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com
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

07.12.2021 14:04, Sameer Pujar пишет:
> 
> 
> On 12/7/2021 3:44 PM, Dmitry Osipenko wrote:
>> 07.12.2021 09:32, Sameer Pujar пишет:
>>> Tegra194 HDA has only two resets unlike the previous generations of
>>> Tegra SoCs. Hence update the reset list accordingly.
>>>
>>> Fixes: 2d8f8955fe02 ("dt-bindings: tegra: Convert HDA doc to
>>> json-schema")
>> The original txt binding was already wrong, this "fixes" tag is wrong.
> 
> The text didn't document "nvidia,tegra194-hda" compatibile support until
> the json-schema conversion happened. Perhaps the text doc was not
> updated when Tegra194 support was added. So wouldn't this be right to
> use json-schema commit as a base for this?

This problem didn't exist when the binding was converted. Should be
better to drop this tag since it doesn't add much value and creates
confusion, IMO.
