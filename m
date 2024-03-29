Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65C892380
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 19:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2422CB9;
	Fri, 29 Mar 2024 19:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2422CB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711737607;
	bh=qw+LyXS4Jxo0zDRbwxDiYKHnX2Jw5hLsTZxGE8VC8ss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O3VXPtyE3MQPcbfLMNPr5b/jKhx+qcPLvoV9Ub3Vak+jtFLXqjyBBzHF0M3TsFBxh
	 WDAmXnoCMvRbt2mLUEjFAUQ9NP0x7DfVz533FZ9sdqr8a8+mIOlld/pI7zRmKTIMO/
	 MBIb1KyfWDYBEsV6KuDMdqq0BpESMRZwGx1b/Bq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94733F805AE; Fri, 29 Mar 2024 19:39:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A268F80579;
	Fri, 29 Mar 2024 19:39:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18DD2F8025F; Fri, 29 Mar 2024 19:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 602A1F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 19:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602A1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nYYyxYaU
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso2187143276.3
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711737559; x=1712342359;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=nYYyxYaUEO2QQb+1z71yhSCTCZxXshnrNWs7HdgukucFFn2anKJS/wcNZS6GbZ9sBN
         7/F9t3KslwqGy2mtQjErXScy2HFsJnIHoA/G9dBlXa35YSRcf8HBkbTHdEFThMORyOpU
         AZn04s29SEYZZDvVIorrt6J7XpIpEmIS7GdCmNdCvrq9nO71dCF6unaDh9oyzvUtFKmp
         /ZqbpL+D3nAaAOisZE+jHlUKdkz76oeQ4oaIStvW7ifc+Bm6N0+TbfgGfWfbHA9kZFtu
         pUQZVbySNzY+UQXWBN3wom8Rkqml9QlmpbyhiR/LaSuwcI/Iwgu5G5HWSgBdnlo6P8fG
         n2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711737559; x=1712342359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=Ucsj1KEGk9kwPZQQuXTQjfJecOrT2bPN+4Beaz//Iqu+JwDBfi9zu4A6OPFdO1L+I4
         ApgDUZ6eCZF6yRoUwY1dLq7DMW08cBMUNVlZKy/i+o+ui9h0JxE29qY7ySDgvsOWvBxe
         cWHzHXVcYVhADJ20SNMdBVpBYOmob9+YPjkCqFmgU55o+Z/20yYo6OzScObTCmVunlqJ
         6CM3M1YADOrlECUPJ7sHXEybpkBeh2mpab2RwpxZ1mJY4GVhgSZL2u9qM2hPAaAMu+SB
         7Xj9qDqpl778G5sSwjZPoa5A17PCWFqxVCKdIi8K083fD/5fmoOBmsZduaDx8D8LbD+I
         H3oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp1zXYc2ARNq007EMZKVbN3w9Sg4QnkPyYRsoh4K0JvRTnOx14bRPQ+to6rtCKFO8rGO4JCX0PHAPP8nP6RWClecuVNqL8yZ742kQ=
X-Gm-Message-State: AOJu0Yz4Qp1PBz5GGnTcx96ukbXNVDlLW/WQ1jxW6zRie+xO9PpXvcEl
	R6Htl6Y8id9zlFGQ4EYOmpLvseQh4jcgOeZzdOwjY0o6Nv32xyA3U3mlGT9klNkESFPHIWyGsNj
	cR87GpKSvftRBKJxfA49SvVrOBTnpU2+Zf0R05Q==
X-Google-Smtp-Source: 
 AGHT+IG6LHCIDykcmLA6i5jn5Wvc80VbM5tLJ6fDDXX2T5HcQwx31rikXyypNkMk6YErFbMKbGLu3vNXn1mOcGtZ810=
X-Received: by 2002:a25:f622:0:b0:dd0:972b:d218 with SMTP id
 t34-20020a25f622000000b00dd0972bd218mr3373650ybd.41.1711737559195; Fri, 29
 Mar 2024 11:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
 <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
In-Reply-To: <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 20:39:08 +0200
Message-ID: 
 <CAA8EJprLB6+i4H5tK9LbJYOEH8v9QF78u-+HMmqPqfpvz5J8zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com,
	quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 22D2DAUQKYFTBPZDNYYY5EAAUUMSW7RV
X-Message-ID-Hash: 22D2DAUQKYFTBPZDNYYY5EAAUUMSW7RV
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22D2DAUQKYFTBPZDNYYY5EAAUUMSW7RV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, 29 Mar 2024 at 17:20, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
>
> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>
> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:

Please turn off HTML mail composition and never ever send HTML email
to OSS mailing lists.
Now quotation levels are broken...

>
> Add machine driver for qcm6490 SoC.
>
> This initial supports which includes WSA883x Speakers with onboard DMIC
> connected to internal LPASS codec via VA macros respectively and also
> WCD937x based headset.
>
> Add compatible for sound card on Qualcomm qcs6490 boards.
>
> Granted that qcm6490 is similar to sc7280, is there any reason why you
> can not use one of the existing sound card drivers? Like sc7280.c or
> sc8280xp.c?
>
> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires additional machine driver modification.
>
> Example : Required new DAPM widget change in machine driver for MI2S interface which is specific to qcs6490/qcm6490.
>
> So, using new qcm6490 machine driver.
>
> Will try to use existing sc8280xp.c machine driver.

What about sc7280? In the end, qcm6490 is sc7280 with different firmware / spin.


-- 
With best wishes
Dmitry
