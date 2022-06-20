Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEB552462
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 21:08:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 555B22457;
	Mon, 20 Jun 2022 21:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 555B22457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655752085;
	bh=Cyqk0FLce2BfAzTvRcnuTjv+fxRAgcrf4BxFIdU3WMU=;
	h=From:Date:To:Subject:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tWmtoZy/IQyCjqYeRUJyDL+sP0/dLqOLpp4Rz+8lH90UncYYjpfE7TPyH02Uy4wf9
	 po+1ABaWpOstPrJLjXDndKyvI83nQTjyMtWRCh6TPUHHgZGa+kj+2TjisF2VTtd1DO
	 iQcVBgh8F4DBi4LaxA0KHWQ9V9ns4zKW8oi6JD7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D367BF804DA;
	Mon, 20 Jun 2022 21:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186CBF800E3; Mon, 20 Jun 2022 21:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6808EF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 21:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6808EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com
 header.b="BXqp5j4J"
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101b4f9e825so11142278fac.5
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:date:to:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=Cyqk0FLce2BfAzTvRcnuTjv+fxRAgcrf4BxFIdU3WMU=;
 b=BXqp5j4JBUECXU0iQgSGRsAPeyZqK4xyw4wON8C11Tc37KHsWCtZxAiuQIAidp2adV
 99wOZTceJnAWZ5SpzdrE3hEBVvp8vSyUunwq0XfDbewoR+yYp5LUCdksCr31pmiUCUKu
 7jPNX5582uLDr+LfATij9+06dgdPUguh2NVtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=Cyqk0FLce2BfAzTvRcnuTjv+fxRAgcrf4BxFIdU3WMU=;
 b=RgUXS0whjMSEvt+vJlWZpNaTImCW8U3qk80ch4DaEwcCS0gStjpUqns1v45hNpZq8h
 LCW7j4E9ZWOyfMYc1I2UUyMwdBK3jocw7BqdZJ5YTWwPxP0HfL065AIFhtuLl7znLnXQ
 AZHemH5MbNIIReM/o0ZJXHOYzmwDWRdbx/eNKWhPlP6m1qErPrlbdC06CwY+Zqmrnqul
 AK1Dsex/uvrqCD4k3lFzgydHIlS1BuLufA8on2pC+kOkUCHaHJe9Gqjsrd+reOZSBxqn
 JhsXS8H7ugfvOPiOxLz+uN1oc8Yg3qLvZcSVs7+8rYt512430CGul9y84FlUM4EuxN8x
 aYCg==
X-Gm-Message-State: AJIora973aYGtm66nyNzkWdPWIFnq7i+hKel8gl7RHwc9Pt3kr1Kumqy
 ODlqd25p34sGoTdDijYQuFAzr3dzm4Mqag==
X-Google-Smtp-Source: AGRyM1u13AVNVT2SLKJuzx8YtvuLMCIAf05RF0vitKNNb/RHNecq4VBpHZ8dL/5qU1XBIAVpamhWQQ==
X-Received: by 2002:a05:6870:f149:b0:dd:f3b0:986d with SMTP id
 l9-20020a056870f14900b000ddf3b0986dmr18945786oac.148.1655752020062; 
 Mon, 20 Jun 2022 12:07:00 -0700 (PDT)
Received: from reactor ([2600:6c4e:97f:f5b1:ac1d:3acd:da98:531b])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056808140800b0032b61c33352sm8099099oiv.7.2022.06.20.12.06.59
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 12:06:59 -0700 (PDT)
From: Michael Welling <michael.welling@konsulko.com>
X-Google-Original-From: Michael Welling <michael@reactor>
Date: Mon, 20 Jun 2022 12:06:57 -0700
To: alsa-devel@alsa-project.org
Subject: Re: Re: Enabling fsl_sai MCLK before codec probe
Message-ID: <YrDFUdPvpt4Nq/WX@reactor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMM3KADDNMD0X6q_vPbe8xLgzJ3Unguhz29Xk5cwnwaD2YmwRQ@mail.gmail.com>
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

Ping.

Any suggestions here?
