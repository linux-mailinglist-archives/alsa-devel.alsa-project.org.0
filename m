Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264B691430
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 00:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D9C83E;
	Fri, 10 Feb 2023 00:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D9C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675983823;
	bh=peCJVQecXiLHv3VXuncr9j6C4VPJqGmOwwEqDhMNFz8=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nonCfmg6mRz+QOUoctUekpBY92eL4NfuoPwxbExaoQJgEINOlWiqi4ML6zGEYz/to
	 3Alo+OhS8TvMs3D7xh9mVRCh+xXmYNwQjBYSJHdPazR4f/gXGr+LFiaCZJn2fq8erL
	 thqt2i/xiHQLQxoHSPn4DTpmBL/6FtRyM9oG/DFM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5F9F800B8;
	Fri, 10 Feb 2023 00:02:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C044F800E4; Fri, 10 Feb 2023 00:02:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 138A5F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 00:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 138A5F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=B5HUOCGp
Received: by mail-lf1-x129.google.com with SMTP id o20so5485800lfk.5
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 15:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peCJVQecXiLHv3VXuncr9j6C4VPJqGmOwwEqDhMNFz8=;
        b=B5HUOCGpwgLUqbC4wEvg3NBmzQlrcVv8I7q8behP9ZS1KxrSrTKKwgxffb5SlEdj7/
         c6kCqKxnxVI9w4nSlTtToqohyq7q4A5zg0DZCMP3kdL23OYhqEaazuWYp4HA1apk6BRP
         PotAfLhGkN3x5CgikLrhCQ5k8VuZtWz4cnjL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peCJVQecXiLHv3VXuncr9j6C4VPJqGmOwwEqDhMNFz8=;
        b=zH7xsBqQHNCnPISUvNhAE7Yj/ZcQq9PVksNEle9wIUPqbgu8HU9QSECt9X0PZTzezz
         BfG8mm3I1OMV6svqulWFpQQFvPd2P7xYrTw6zFEaifK7JlpeAOWk3rlnriE1n5z9Tejk
         9d8ITTwvPmd0ZiUhSRJIWCQidaQ0wt/KxeG5g9OkoU8NOCkNWD4J8alBDbpOeiEXZPUJ
         BdteSqqrldCxB3kc2LOX0P9CxLKMjAh/0GQ+1nhTuz7oFPP7dlAbtosxu3BYBrjza+px
         gC2WIqico9sDAS715J56o3qBVh4w+2TADmZMBZwkixT3Ae8qc0mG1exvJqAMtoORbK1+
         Umyg==
X-Gm-Message-State: AO0yUKV+eDnHFRxlfGo0ugLqMVE+nY5qipBs+2eiJMHQO5wyZI4XR03f
	PxWXcih6vR4ddOlK18E7gr5hmLI6jLWRorPPtg9NNg==
X-Google-Smtp-Source: 
 AK7set9XzpuGNqRAqXswm7rG7nSvFG+aoMpYdg/hD1V1I6Z5i9A1s7NpUUjg4N7dzUIRNs9kGqMCjDgeIKJwkZ86bPs=
X-Received: by 2002:ac2:597a:0:b0:4d8:62ec:1ec0 with SMTP id
 h26-20020ac2597a000000b004d862ec1ec0mr1894709lfp.247.1675983756760; Thu, 09
 Feb 2023 15:02:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Feb 2023 18:02:36 -0500
MIME-Version: 1.0
In-Reply-To: <1675700201-12890-6-git-send-email-quic_srivasam@quicinc.com>
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-6-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 9 Feb 2023 18:02:36 -0500
Message-ID: 
 <CAE-0n51Ov_0p0JW=4M6NsVzoKUBGaZDKAJtm+wHMMLMiNpDE1Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] arm64: dts: qcom: sc7280: Update lpass_tlmm node
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
	alsa-devel@alsa-project.org, andersson@kernel.org, broonie@kernel.org,
	devicetree@vger.kernel.org, dianders@chromium.org, judyhsiao@chromium.org,
	konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org,
	quic_mohs@quicinc.com, quic_rjendra@quicinc.com, quic_rohkumar@quicinc.com,
	robh+dt@kernel.org, srinivas.kandagatla@linaro.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: AZXRLDZIA67FWQ5GI6SXMF6UIIMNQSA3
X-Message-ID-Hash: AZXRLDZIA67FWQ5GI6SXMF6UIIMNQSA3
X-MailFrom: swboyd@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZXRLDZIA67FWQ5GI6SXMF6UIIMNQSA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Srinivasa Rao Mandadapu (2023-02-06 08:16:38)
> Update lpass_tlmm clock properties, as different clock sources
> are required in ADSP enabled platforms.
> Also update LPASS_MCC register region. This is required to avoid
> memory region conflicts due to overlapping lpass_efuse Q6 regmap
> region used in LPASS PIL node.

If efuse is overlapping, why isn't that made into an nvmem device that
can be used or not used depending on the configuration?
