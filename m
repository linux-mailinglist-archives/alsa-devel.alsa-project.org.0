Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2992BB58
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112ED17AF;
	Mon, 27 May 2019 22:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112ED17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988211;
	bh=xJqYeRUU9H/PmcOU8zsmICmqfOIfKNCmfmd+aDTTsqE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXQTL40XgN6Jp9RRveHjRBF1XQwpkCD4/THy5/NjBx0doKH3VJNuCKy08J+Tl0Mdv
	 CVLBHC9XIafDhGC/1VjaBvaK+/VcgQuWlHmZnjWyb6lEvAGodeb43FZWNdwVVgfk4f
	 WuFepeOkf7/IcDTcAlAsLGqoETKDX4xz2cs9WVe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E805BF8974A;
	Mon, 27 May 2019 22:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1091F8972C; Mon, 27 May 2019 22:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 652A4F896E5
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 652A4F896E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M6NSmREE"
Received: by mail-wr1-x442.google.com with SMTP id f8so17893328wrt.1
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mz71BHS9e6D0Hy+3p0/CgKuWt1VgJzq7zAM5T7mHY2o=;
 b=M6NSmREERHUhm81Eo7IuTxUpuFP+O2QKTs1rHcMBsH+vW/UC9wceluBnsJrjaPOY5h
 MNA6H8BtJHteTlZLpN/sy+oSx9ap1bEV2+F0GDTrPV3fWYabAAwLYtlwnKnRo5PXQcfa
 51O8A/J7YbRZO9sFbqfVf/aLJy5ATWHkbwL7Upj3u450/xMT8SUKVHTj3gOqVKNScrzS
 qaQ4CL2or5UnftkiEbZme3wLRF1+WjEU9V7SbaGVokDpT1KlzJ4CBVSPanilaF4LV3Mp
 yulGDKjxL/2EvbKQcuKqYIwg4o4qgUU0GEhF9lIIA9XX7fYxEqGHgqUE+NkNpLqcUKIZ
 cbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mz71BHS9e6D0Hy+3p0/CgKuWt1VgJzq7zAM5T7mHY2o=;
 b=fe/WM6lBh62Zb8OeW0N4KLP+ov7cNtksCSXyrzs/98dtYSc9+zMk3QzY0WYV0fZJOn
 /HbDPRqgTkKInZ/k6utZynUDmhXqP3OxLOZmXPxJT+0dr6eInlIgercF8ytQb1ksFVXy
 aGMjEwlq86X5nnbJuto4Wa3CjZh3uOnYT+qh8v0XrHecX5f5vhT6aRegs4cR+NeQxLCg
 c8P3JIiwj3avkUCkrDpIQU7zjiSQ64vMqGrLFxev+kqMo06n53vT/2FTTSTALT2X86j+
 qm+fxVKPhDa0DNM4nUKht26mV5JHQ/s+DCAG6XiH6dnpB3gmmcxLSIimwxuJvdQtA0Hx
 BsDg==
X-Gm-Message-State: APjAAAUObPd9xvJul6UjkDkM1vV57yljId4m6ulWh1B/MbuP3aftbf/X
 9kbaQtxVjb3FpjwMUXv+n7A=
X-Google-Smtp-Source: APXvYqwreWc3qdqZlEF37v9TKTLjOM/6tvYOmcXgC1h341LClrB3k+x5Mddc07/qjcrkAIgEu5+tvg==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr58006682wrs.314.1558987821585; 
 Mon, 27 May 2019 13:10:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:27 +0200
Message-Id: <20190527200627.8635-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 7/7] arm64: defconfig: Enable Sun4i SPDIF
	module
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QWxsd2lubmVyIEE2NCBhbmQgSDYgdXNlIHRoZSBTdW40aSBTUERJRiBkcml2ZXIuCgpFbmFibGUg
dGhpcyB0byBhbGxvdyBhIHByb3BlciBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
UMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwppbmRleCBiNTM1ZjBmNDEyY2MuLmRlNWI2NWQ0NTMxMSAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
CkBAIC01MjYsNiArNTI2LDcgQEAgQ09ORklHX1NORF9TT0NfUk9DS0NISVBfUlQ1NjQ1PW0KIENP
TkZJR19TTkRfU09DX1JLMzM5OV9HUlVfU09VTkQ9bQogQ09ORklHX1NORF9TT0NfU0FNU1VORz15
CiBDT05GSUdfU05EX1NPQ19SQ0FSPW0KK0NPTkZJR19TTkRfU1VONElfU1BESUY9bQogQ09ORklH
X1NORF9TT0NfQUs0NjEzPW0KIENPTkZJR19TTkRfU09DX0VTNzEzND1tCiBDT05GSUdfU05EX1NP
Q19FUzcyNDE9bQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
