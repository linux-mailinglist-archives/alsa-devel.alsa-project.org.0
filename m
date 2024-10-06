Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B8992128
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 22:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF05C84C;
	Sun,  6 Oct 2024 22:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF05C84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728246717;
	bh=j0wHohpCPzzDKqxtrAk20/ENTrWHOfp9eS77ZWfWBvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iT+3Z423YVsvE7NBWKtFUQr/FDYTIpk9UA3GPenREljj4cAFdXd4X0+PX43Hroa4o
	 4Bk7eC7uHfah3A7czTWs3sba0UFwXXLC2nMWU8Pvo3/1CaRKe2SfR3iGKEtA0DDwdp
	 vfz20F2w6ZkQ/2oEBYzu8/em3mdodu8FeJkGGm6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84046F805AE; Sun,  6 Oct 2024 22:31:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB82F805B4;
	Sun,  6 Oct 2024 22:31:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB0AEF80528; Sun,  6 Oct 2024 22:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20E32F80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 22:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E32F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BW/erKdQ
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fac3f20f1dso38035231fa.3
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Oct 2024 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246678; x=1728851478;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnDB2fW7Uiplt22brqA1RNzhLsSLQ6D5krSMR8PbvZ4=;
        b=BW/erKdQkwgRWxDvCz2bDuFZTZkgWiAp2b+48PLO1sqwVGS+GlVT38SWd71CfN5JE6
         RSIDiYfW/zV+2sja4KaHz3xndVamo6VFTjadKsZw74JAXTqRuXtkI8eBI86WHOt/64/r
         mmjNjnWO6ECqDFdOE7BG7/Sb6SZr/6ezmMusDVkQb1P3qhcHm08U3WqOwg7glWDQ2asZ
         oVGl2+3WQgkRWkl1Sl1TfOw2CwU0b5GJ9KBCRTNOrcLyqdOBbJB6VIyZn3DK/SftNZuR
         Ul+1f1z1LDhs7ReQPShzAfYhYFrC62OM7T/TRg2c4btRhtfxk3XIBwEHi2sV94wOqFOb
         T7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246678; x=1728851478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnDB2fW7Uiplt22brqA1RNzhLsSLQ6D5krSMR8PbvZ4=;
        b=Ic+pvXjWlwn6XBfoP5RI8wypHtVCchZWhL/b6zewcXTjoEnB9JTmKEv9zZ3L3Fne2n
         SSb35y+rSnZRG0kyAsYp73pOJ149E5pBpJTwhYkdLHLiJ83Ubv4nlgQt6jt6Wq3TEoqr
         yXce6jX7/qXbBYbekWmkqOBRcfNS1PgXAlQ5jBqr/FdADIVKz+eXouGV16kxm4aVzW3C
         RJSj5hKKy/06vUvSOlKWRJfeZ90AmbjNfDTHZAh1fD1SCSWS20nK+7F+PZOdYRWT66RZ
         19lg9RiwC0iCDlxeKKd0SUFbwvibHo6aboAEZIMuVFkpBycARaHHwzPExCcAkSW7u6aq
         EE4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKSaQm9p8/MherZb6MAd+cWl+Wz3cWGfw6ZYmrUmwi6OQWHJRWvgrflDaY9dBK6rNrBvLXQlB2fI8H@alsa-project.org
X-Gm-Message-State: AOJu0YwzByRq9aWFN8qB0arsAomQpkxmfVxo/OYfm0ZKfDxhIRSlJBEv
	7mZ4GtkHTlcb8lFlycERapmALEFI6jCVmsLfGr7NXepTg2zTJfgqgC3zczfblHo=
X-Google-Smtp-Source: 
 AGHT+IFub05WOwLbe6F5w7k7wYQXANrXi+2huDuX4RyxzjTbcyafo7jRZJALI7WYI52WZaiVBQ3qhg==
X-Received: by 2002:a05:651c:b0d:b0:2f6:1d35:1491 with SMTP id
 38308e7fff4ca-2faf3c136dbmr45471801fa.15.1728246677803;
        Sun, 06 Oct 2024 13:31:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9b32e1dsm5814791fa.107.2024.10.06.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:31:16 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:31:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: Re: [PATCH v2 3/7] ASoC: qcom: sm8250: add handling of secondary
 MI2S clock
Message-ID: <67b42rl2czgaunfhfgojbb7na5n7hnvdb2pmz3zqaard3zuujg@te2lgjzscw6f>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-4-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-4-alexey.klimov@linaro.org>
Message-ID-Hash: IDMCWZ5RJF7I4PVEB6XKALHV6JED3PYW
X-Message-ID-Hash: IDMCWZ5RJF7I4PVEB6XKALHV6JED3PYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDMCWZ5RJF7I4PVEB6XKALHV6JED3PYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 02, 2024 at 03:20:11AM GMT, Alexey Klimov wrote:
> Add handling of clock related to secondary MI2S_RX in
> sm8250_snd_startup().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
