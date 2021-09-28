Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFD41A606
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 05:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 313C216BA;
	Tue, 28 Sep 2021 05:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 313C216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632799281;
	bh=uBD1n1LtjCDRPysIqzZRgbwDKg/TMeDHw+kp9VClabc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIjcCYyYmAkZGQwJU9zvA/I7lQGhf5KOANN29j1DQg+Z+dylkJUS+qudOz0hDNw7u
	 EBZsIt1QxhQMjTScPDS1MPVHq+dDY1pBoDzqnftIYBnlkX5bVMovYR2NJo7qTLXSm+
	 VFfwvXzyV4lO+M7gMwe4j/i1jlA4MA4h2TXp+vuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D13F804D6;
	Tue, 28 Sep 2021 05:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48FF3F804D2; Tue, 28 Sep 2021 05:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1667F80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 05:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1667F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="t26S2A58"
Received: by mail-oi1-x233.google.com with SMTP id s69so28241684oie.13
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BY/5t7wTdvjVpwDuXNWwZUvcg5QReOgiRCNTnTuZFk4=;
 b=t26S2A58lxtJb9UOtXoX9vpowEkNqr/uJlCSIcATShVMnKQQA0kmcRpGwQLBylFYQr
 uI4O+4NO9B5Fvsc042saoaMWF8ioD7QoDlgUQDtFlhCl1AD4JaBkuN9PWJ+vrhq05JUA
 EcGFbwil4Tkzs9efuM9sbTivp3pZeLdgxIDQ8ID3U4M2m97HZjIwvfV9Z0B+YU4CVX0K
 zKmxZrbJ2VWjHqWJmo6XtlLLE/wCRyDAWhFnJwqVoXpqVLmP0cemFKTP/3fJ/e6CjRDg
 N1TFS+dRU/Xh+pGLAGtvx6w8oOz4c1orXLyXdz4HZ31eCtc8frZ9biktfs+SxX4oWlL+
 FctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BY/5t7wTdvjVpwDuXNWwZUvcg5QReOgiRCNTnTuZFk4=;
 b=XLh0xFbrywAm/BqjoLYUmKeESNmE6QojCwD/kxJoETSjO2SvSLPb68sP6+1ianXNjB
 N5Z9r4dmwEwSpvxmzIlH0g/Wqyz6d0bAR9LZCfN0+hmkYjCn1b++BKPs53chHfxXRZTD
 x6Bu/+4/ioy0nJ+AlKYHRzkEz2uC2DONFzVzARxu05IWsxLAo2BZwGcpqvejMMIuDErG
 vG0+ibjLk6sGA0HXBv0y8wY3II9pfYimIlSSGew55wJ520u/LdtLoozWCJKibRrNc9wf
 kTh9APqhwwRDR4bVJlwdCYLUqHnd6+a2+1Ita5YrIbnXaZn5r0Cf+lJzoxTGQ3TwFLZ/
 QbSA==
X-Gm-Message-State: AOAM530GdHDZDxfwEnMzh1ntNZ5VeM4FkyToV6jEqh3Jp4wWUOXJwIDB
 dOQH+++RdF1tzCfEcaQFmXNgcg==
X-Google-Smtp-Source: ABdhPJwJXFE0iZAc424TD5Oabs5g+Dkyl1gE/Lj29AkoYGBfNGoI9TTSCkcjF+anL6oKIDo8Ev9qOg==
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr1951100oic.86.1632799204470; 
 Mon, 27 Sep 2021 20:20:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t29sm280137otd.7.2021.09.27.20.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 20:20:04 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: robh@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 broonie@kernel.org
Subject: Re: (subset) [PATCH v8 00/22] ASoC: qcom: Add AudioReach support
Date: Mon, 27 Sep 2021 22:20:03 -0500
Message-Id: <163279918313.1542640.4435970499489136227.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
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

On Mon, 27 Sep 2021 14:55:37 +0100, Srinivas Kandagatla wrote:
> Many thanks for reviewing v7 This version addresses all the comments
> raised as part of v8 review.
> 
> This patchset adds ASoC driver support to configure signal processing
> framework ("AudioReach") which is integral part of Qualcomm next
> generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
> It makes use of ASoC Topology to load graphs on to the DSP which is then
> managed by APM (Audio Processing Manager) service to prepare/start/stop.
> 
> [...]

Applied, thanks!

[01/22] soc: dt-bindings: qcom: apr: convert to yaml
        commit: 985f62a9a13175217978a797cd8f1f26216b2c87
[02/22] soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
        commit: 1ff63d5465d0b0bf4e69562096b2d3ec9ff1a116
[03/22] soc: qcom: apr: make code more reuseable
        commit: 99139b80c1b3d73026ed8be2de42c52e2976ab64
[04/22] soc: dt-bindings: qcom: add gpr bindings
        commit: 974c6faf7667e551d202712470ca210c14ca249d
[05/22] soc: qcom: apr: Add GPR support
        commit: ec1471a898cca38af6b8956a83ebc1297214546f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
