Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0B145D020
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:35:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAFAB17ED;
	Wed, 24 Nov 2021 23:34:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAFAB17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637793328;
	bh=13HiuB0PQEbx+LTXLOOybpv9xesMPPpW/uCegccYrrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWadSctUOasOhsAzaOT+evFjY+p7TOskZ4oqDqWdOStWroFV6KveHLsFzigUTKwYr
	 FO//LQk0BUb0Bc15ARgam9oLRmA1bDrzZqksbdP7Seh0RwwG7u5C7QD6TG2g3+SPhj
	 j8jGtdRZ/HtGeCB1+BUK/fro8vWz69y5qiWxLNKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C76F8011F;
	Wed, 24 Nov 2021 23:34:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9241F801F7; Wed, 24 Nov 2021 23:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6576F8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6576F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MUG0/Jr3"
Received: by mail-wr1-x42e.google.com with SMTP id a18so7145602wrn.6
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4Q2WMbwFeQlxE5UxwxCmdsVHaD6RTJAuT746XcgHHM=;
 b=MUG0/Jr37M49Ed9L1GWkptdvArVfAt2F4zRNyDNatp3LEqXgx2dzFxWfhSvuizU4ri
 PILlvSgtDqXocdyOZYAbxwy/CEos7FkxGPJUbUF1GlPiFvkEkPXN76E3zNXYatF6f6d+
 s1o7cPCaBC7wZcLgwLl4Go2vTFH5Sn9yoqnQ5QQY6Gd0p642vWpxEFib61HvFFadVUTh
 izCX5kjmMNW/b8eTAdcOu752J77M+L/pzm3Bb3402JY14dwioOPiKiZ4iYGDXXcZU4iX
 AJhvPQGinMzs33sf+aVa96fOJqNtkiWW0d1C7nJ6TWr+m9u2rF33Rab6FNhzhOD/WjKm
 pqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4Q2WMbwFeQlxE5UxwxCmdsVHaD6RTJAuT746XcgHHM=;
 b=wzC6zZ9dAnLAz1x2crqQvKHQGT96aA0LwxRMheM0QCPoHRHLNhPX+c09aienlABbAF
 CGwKqsiLS7lIELbmLAcGAjx2aQTfR7jycjIvX5+0qc/dRthrYhgvaZjUDunsanZqODIC
 IubSRQ8fsHEn11iFfbst3Xtvm5mDIRGLbLY9CVIDGJ+NbpnnjQygRskEVesi1F0D2lyE
 XHYhXxyqEUdL+Pzf9meQ0h79QMSvkrNbnjFuBy7attCLsWJjkHpIr/8TgQj0LkvmQXH1
 I7kqcAfR30trmWVTPi9v79BNq4fjK6UNxbDUKNQufCNa9xPTLI2JQl574z23WhDI6W41
 dPcw==
X-Gm-Message-State: AOAM532pRo6QM5LbBF26BtwVuTXwYjpVaPLYZFNDQzUjKqLZ3Yu68g47
 VCNFfPK+XHs3Z6tq11jJHI4=
X-Google-Smtp-Source: ABdhPJwzobNWdnlIEAjGt1nVfaCJcA9nbLer42dE1RjxTnPTuFWGOIoMp8BrVDZpiWCxc6iCF8PxaQ==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr701595wrt.453.1637793243432; 
 Wed, 24 Nov 2021 14:34:03 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id h22sm1214466wmq.14.2021.11.24.14.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:34:02 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v2] ASoC: rockchip: i2s_tdm: Dup static DAI template
Date: Wed, 24 Nov 2021 23:34:01 +0100
Message-ID: <8149774.Fl3yekHNAf@archbook>
In-Reply-To: <20211124212146.289133-1-frattaroli.nicolas@gmail.com>
References: <20211124212146.289133-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mittwoch, 24. November 2021 22:21:45 CET Nicolas Frattaroli wrote:
> Previously, the DAI template was used directly, which lead to
> fun bugs such as "why is my channels_max changing?" when one
> instantiated more than one i2s_tdm IP block in a device tree.
> 
> This change makes it so that we instead duplicate the template
> struct, and then use that.
> 
> Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Disregard that, this patch is broken too because I still use i2s_tdm_dai
elsewhere in the code. I'll respin it in a v3 when I've actually slept
enough to not make these mistakes.

Sorry for the needless e-mail noise.

Regards,
Nicolas Frattaroli




