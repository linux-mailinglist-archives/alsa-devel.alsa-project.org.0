Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB738A0CDE
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53EBA2999;
	Thu, 11 Apr 2024 11:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53EBA2999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712829364;
	bh=x58WqDrW54mbSDZg6DVW0SdiBq5P4n8LYvlGtzYZ5Fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cVD/D0KEK1JlpXzpeuYozUyWRq407PhGhQzmO2IJTPhcvN/7cEvEDpCKuk+PgDi/P
	 HNE4jh61Bd3Cw6Vl3HrhoPNo/7f6X4CGJV0/7oxtdLZl6K8lA8bZuDpDb2Djo/PQSj
	 lRnoPkXa9pRX9Us8GXQwFKYanD3viVzDBmteK+yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39129F8056F; Thu, 11 Apr 2024 11:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9915FF80423;
	Thu, 11 Apr 2024 11:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C65D0F80238; Thu, 11 Apr 2024 11:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C95A8F8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C95A8F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MzUwxBoq
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-417d0194703so5053655e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 02:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712829322; x=1713434122;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlGP44dphA3R+UbqzP2my5uJQJOQh7ETKlgiCn1Z/F4=;
        b=MzUwxBoqbSUy6HTsGkjwycrLA+T7gyN1tfMjO0akRMKeNPMhSaaCpKX1Y2aoeUkd31
         sSf43U/fX1luF6sAYMcn/Xm8SxggDCI9mxBAwmwnBsTWlW5bo1V1fBiQTeKDVqKaw32D
         pXNS3wM96hw+U25XKYDg/13UtanOvaTF7jwJleyFGbjBFqgaiWvlCfW+nxr8iRy2l1Hi
         Ci509ksr9KH12QPvxUrlogqvCcZFb15CVkSfdMslMNdQwIFIHxR5kXLhLxe5Ev1BpUMF
         xGWZlGxhLcuwX0zPAOMXsGDDuVpNubXnbI8oZloONBXbNBtKphch/2pKXdAwDRlg0/b/
         jy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712829322; x=1713434122;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlGP44dphA3R+UbqzP2my5uJQJOQh7ETKlgiCn1Z/F4=;
        b=hXdB0q8XHORkS5rWbkzlHxLpQGVKrTAK+IiljrT7fasaFnYvV2OwdR01mVRHxLdMkZ
         HKDy7l7sNxWR/XC3PDj0ox9Z8auyQ9oOk3+hfCDr9RsTyvv5LVjJpGeGCvbGK81yMfnR
         OTFgFW2XzwUoGrgqPYYg1JS6CiuLNhYH/L5LjrZHeFW4lR6Xj54oDmYDro2eJf21TAJp
         TFaXOxlK0HuyjUTSRjQyRIqPFb+gd8ACYvBnjtjMMrZqBh4oSOVqJNwL8v1RItmeWE5W
         mw7ITWKCD1b0VZBb9AilcMwPYgMlQyX1hhcpNBrvpufUigz0hKDD6DPBfMmsLnnCz6/S
         /2ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwO+KQ+86Jj2ynJH2Sq92bK72qZq801Zq4l4ML30O0cYo1mFaeYNLP6HvJX86AG8zAxyh5dwGOS2wNqGKoq5R0wiAqoBx1WKkuans=
X-Gm-Message-State: AOJu0Yw8wAHOIfg39pp4JxIGQM9CFxJRVviubGM+ounsDA/X+Td2qfIj
	pbEXYkeegJPG/ncbYMVigtIT7FOcjGyvj8U1LCghRiWI2IUMVsO58uVVU3PSvI8=
X-Google-Smtp-Source: 
 AGHT+IH+8tjSkXLDnfEBY8Nl1q3OV/1O/GEG0fXg6mYcVntFO0qT8luy7ERWu78WyTA0HYHQdNoBwg==
X-Received: by 2002:a05:600c:1388:b0:415:46be:622f with SMTP id
 u8-20020a05600c138800b0041546be622fmr4697912wmf.14.1712829321839;
        Thu, 11 Apr 2024 02:55:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b0041690a1c9desm1792206wms.30.2024.04.11.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:55:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
 stable@vger.kernel.org
In-Reply-To: <20240306091642.9123-1-quic_vdadhani@quicinc.com>
References: <20240306091642.9123-1-quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Add timeout for wait
 operation
Message-Id: <171282932055.158508.13864797939880326855.b4-ty@linaro.org>
Date: Thu, 11 Apr 2024 10:55:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: LSJBWGPLY4NTVHRP3ESNEIF3V63JIFO3
X-Message-ID-Hash: LSJBWGPLY4NTVHRP3ESNEIF3V63JIFO3
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSJBWGPLY4NTVHRP3ESNEIF3V63JIFO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 06 Mar 2024 14:46:42 +0530, Viken Dadhaniya wrote:
> In current driver qcom_slim_ngd_up_worker() indefinitely
> waiting for ctrl->qmi_up completion object. This is
> resulting in workqueue lockup on Kthread.
> 
> Added wait_for_completion_interruptible_timeout to
> allow the thread to wait for specific timeout period and
> bail out instead waiting infinitely.
> 
> [...]

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Add timeout for wait operation
      commit: b12bd525ca6e06c5ba93a49904f580f7f0021cbd

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

