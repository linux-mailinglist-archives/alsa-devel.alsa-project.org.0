Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D69836BB6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 17:50:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D669184D;
	Mon, 22 Jan 2024 17:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D669184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705942242;
	bh=NZq5+dAFqn48RMhvQUsO5Asi9OVWgIRdClURIQH3qbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X4vIa4wqb1mpqUx1QAj+5eBgRD5u3QHZPcEwJmpy316yN3hmjpzSAwa/O35Ofy78I
	 h5gCHGR/TQbxVZi9NqRY8pKWbxHomUfdfyFciSdMv4iVUyBf0srB/qo+m26qSLb4vP
	 MeEA63sDd7T0pskerKX8uXW9F03g9h0JJ9M1pHzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F94F8057F; Mon, 22 Jan 2024 17:50:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE32F8057B;
	Mon, 22 Jan 2024 17:50:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD74AF8025F; Mon, 22 Jan 2024 17:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CC62F800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 17:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC62F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QA22mzVw
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so370667666b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jan 2024 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705942201; x=1706547001;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx0v8Bj4GKVZ3QX1c+Yo1eWfE6TjAxBrGSt0bJT3EUs=;
        b=QA22mzVwLbA+egaGp/Ok4sLOMzTc8CIidVwxif29Eh3Ls1gAPUq25IligMliD+9niL
         zy8HdrO5Ql3U67ExBB+cxeBRDIgzMoYh52tOdYpdGylUUcFyzkH95nQmNgnDl7a5NpuQ
         QlbGhJOtKtFNZ6Uw79jHHKyMqWV8rYOF5eAN3l5KY/toxnvvUrebcMruoaAzfeV7qliQ
         fssX5QGvE1ie9b2xJHJSLS+zBvr1Nfngkvoa6jsklnP6FIZ9qPbfFRw14zJz+Y393bRU
         OA7TSD+BAdSpxUX/cCeIqPqHmJs6OPSirf9Bi3C3T2Luaq/rv5vyDFUJy1hh0BjWBEd9
         svYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705942201; x=1706547001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx0v8Bj4GKVZ3QX1c+Yo1eWfE6TjAxBrGSt0bJT3EUs=;
        b=mtxDIE+MG9GBHjTxhWhMcF6xTxRcfyh/pyt00LUjDeDroF2MmWSrc2gTmSXudGgImj
         atgVqzS9S3RVdC3QSqCe5dUcsGQOVPlT5IfODehg6CqwxZ/9AChtxNyFSXPFmGILvNCq
         w/689Fl1nZCsQ42hoKiSRkf0i9Jv2sZdlad3/Yh9aPpLWtR32RIlPQVaoSwgVz7V1alq
         oKuafDcExKfCOcuyafei5ree0P8b4zZWtZvkrHp6zRyDr7FrYa+5pn5cABgyD3kfoy2M
         JDvJ00YuThMw2lOsNIMu+vlCycLcZetIwuCEk9yLpjed5J/KV8KqE0sJv4tmSfKs5lww
         LEOQ==
X-Gm-Message-State: AOJu0YzElClAML7rEUGGmpdZjhA69ceEBzdu3MFH4nfIk3wX6BG6jJWM
	EYhyfac6kn72agFpNRISMfik9dXYDMrJEOTEXG/yVPLWu4ekQtcF0q4mAQMYl9E=
X-Google-Smtp-Source: 
 AGHT+IHOPYeXj/Lsqjzqr8U95ZUAS68kHgZTiMF53h+FacnBwiNk7aQKA+zEWelNKA+si7MsKDlkww==
X-Received: by 2002:a17:906:1994:b0:a2e:bf57:3613 with SMTP id
 g20-20020a170906199400b00a2ebf573613mr1448037ejd.10.1705942201677;
        Mon, 22 Jan 2024 08:50:01 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 bv9-20020a170906b1c900b00a2bfd60c6a8sm13487452ejb.80.2024.01.22.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:50:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
In-Reply-To: <20231221-qmi_elem_info-const-v1-1-81db0a9e6616@quicinc.com>
References: <20231221-qmi_elem_info-const-v1-1-81db0a9e6616@quicinc.com>
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Make QMI message rules const
Message-Id: <170594220086.17125.3833934694462346103.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 16:50:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: MSHAJ3JWFHELQ3SLWGRG43MDY33BOBZM
X-Message-ID-Hash: MSHAJ3JWFHELQ3SLWGRG43MDY33BOBZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSHAJ3JWFHELQ3SLWGRG43MDY33BOBZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 21 Dec 2023 07:16:04 -0800, Jeff Johnson wrote:
> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules
> to be const, so do that for qcom-ngd-ctrl.c.
> 
> 

Applied, thanks!

[1/1] slimbus: qcom-ngd-ctrl: Make QMI message rules const
      commit: 04b945e4cf81a12365f8207a4d34dbc81ba17413

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

