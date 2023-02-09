Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A1691423
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 00:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC906847;
	Fri, 10 Feb 2023 00:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC906847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675983683;
	bh=WiBOVyBS3jxeOLS5jdRWtNyu3Pp242/H876fIFzKAmk=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KrWZwH1w4MCt0CS5VZnE9DbGoKpx7ETtIthit8ZdA353SporB/nQUuy8zPAcY3cnS
	 2cbM/JqKQxbyNwhynNCvPG9UvGg92AJqX1pn2wMbVKed2Co0tAsLxezPPTi9Bvbd5N
	 NVVCO4sTiZUOWLS6bXsh0AvZ7RoO/fjwUvQLm9kQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A8BF800B8;
	Fri, 10 Feb 2023 00:00:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D044F800E4; Fri, 10 Feb 2023 00:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E469F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 00:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E469F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=G363oTKW
Received: by mail-lf1-x131.google.com with SMTP id bi36so5459596lfb.8
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WiBOVyBS3jxeOLS5jdRWtNyu3Pp242/H876fIFzKAmk=;
        b=G363oTKWPd7OTAHTVIlAF1tmSPBZQHap1zu0Q/66JuLHllBgp162JDmob+GrbeJWvw
         ATZsHySDeaefJ24LX9yL8F2nwjMTK2RoCVMhMuDtbFBbGbhF0q6y/MujRxfDJIVDh4Xv
         Z6dFnWw8K1MjPATYPV7WAQz9dbhfP1IwX76JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiBOVyBS3jxeOLS5jdRWtNyu3Pp242/H876fIFzKAmk=;
        b=bP9HohYLwP6cJwG/O1q5F3y7Y+0aUmLA0szOA8XsoVQT60bnuLmTlM0diU1/zO86Da
         irwx1+5dzDSsw/GgvWil1OspyVwlbvbxdWJwsdqFYykJ00z1/WtnXdHKLwlB6hENEpgj
         cSI2uIkxy34RnOkBh1Xd3euDWYhsNGIXeVBXtMCz5vCmVRZQRuq7+eqxqUNUhjg8ISsY
         RmDBVJcPZKMRFxT3IVJvbJEpBE/8rfxiJmtX1TEeY35vEdLjXnM+k+SQ9NP7WZt0DCyx
         mFkMYJv8uJo8A+gkACOL8Jgz7JEyFYyWUk/oyt5IyixDjeCLVyblUtVhwv+TpS41aEtc
         xtDg==
X-Gm-Message-State: AO0yUKXJKKhy59k9jWyURdFCwUhBXo5OJBkU7y3RDHX9ZSLBcK2zm/ke
	+0TUZeAiRJS32yoOQhpAk5AnR3k33wwmtwgG1a3pIg==
X-Google-Smtp-Source: 
 AK7set8dexKAwHHiOYh04Zt8+CurymxnjylH7GZAEI7nXBU47Y+sRGF7NTh0elgledqS7DrUFTzuJJ3IfScVOz2V7Wc=
X-Received: by 2002:ac2:4c8f:0:b0:4d9:8773:7d73 with SMTP id
 d15-20020ac24c8f000000b004d987737d73mr2492274lfl.52.1675983613047; Thu, 09
 Feb 2023 15:00:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Feb 2023 18:00:12 -0500
MIME-Version: 1.0
In-Reply-To: <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 9 Feb 2023 18:00:12 -0500
Message-ID: 
 <CAE-0n51nr9MAVptYuNd3KJYVfbKnE1PiG29e8xS7S0gpuhTjXA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: sc7280: Modify lpasscc node name
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
	alsa-devel@alsa-project.org, andersson@kernel.org, broonie@kernel.org,
	devicetree@vger.kernel.org, dianders@chromium.org, judyhsiao@chromium.org,
	konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org,
	quic_mohs@quicinc.com, quic_rjendra@quicinc.com, quic_rohkumar@quicinc.com,
	robh+dt@kernel.org, srinivas.kandagatla@linaro.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: E4KZITXVE45CADTDHYTTO5OCEZLKFY5K
X-Message-ID-Hash: E4KZITXVE45CADTDHYTTO5OCEZLKFY5K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4KZITXVE45CADTDHYTTO5OCEZLKFY5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Srinivasa Rao Mandadapu (2023-02-06 08:16:40)
> Modify lpasscc clock controller node name to generic name,
> that is from lpasscc to clock-controller.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
