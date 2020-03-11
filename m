Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F41816F5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 12:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B501215F9;
	Wed, 11 Mar 2020 12:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B501215F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583926748;
	bh=7OhOMQVG+beKcyExVg3KAzMHHf/bi3VdOdz1J+KUbEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pu1FG8JIHOfUsHgmbFA0Znyl7m3UHPnNIz9MmzWrDpbhXkeBwKnVxGRVg1hTeYQ9O
	 wKaOI1Q5MiEDyIZV3ODRjqUbdjwg3BClEViYzzN1mSwpTfbO/lOsQ9UEDdrvHHyShm
	 jeimjqv8LCg1/IduZ8BX1BYEzyzVGlRjT4ZPIhwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34881F801EB;
	Wed, 11 Mar 2020 12:36:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2944DF8021D; Wed, 11 Mar 2020 12:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 776BCF801A3
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 12:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776BCF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MjzLEDmF"
Received: by mail-wm1-x344.google.com with SMTP id a141so1720453wme.2
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dSjMYJm/Ra5sgQShi2pf7+T6koKZ++HOxR0wa0eN84=;
 b=MjzLEDmFJ/aZXSENFbjIyt0KVvyajh+YnB/ueDBs1bz0YgVO03hmugfnPZdvU3vt/6
 BBGbHwfSuITh/mzCoIh3L9H5Xm7GhvVopaYxlbzYHEaFpzzGBm5bpH1E14+QPAQj+/Zi
 oz0hJV8Uo0RnjvYx3X/NcoKRTSUE0mxzyaIKrecwFNg9w6OfLfFVZZFSS3L63oEAv3NN
 M85rjg8MG6w/3q6GdZ3z8lcHkRCHWQCV7MT+N8waXX1F6iOwXpQFA9n/FzKQ98EPl1ZW
 LenVwfClcI7m9C49N7ZiYFpAR+wdIAWAcAfIClt6Na8GpVqOHnsERF9aA/UbB7Dslj4m
 DcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dSjMYJm/Ra5sgQShi2pf7+T6koKZ++HOxR0wa0eN84=;
 b=FxBlhULMAEZnbiB+VEbt3jBX0bYaBF9Gldwoz2RxzsIYyxKWhf4DxUIUP/3i69izEJ
 9ixkaNgFBN9OSrlQTBaGGZraPt7zPlhFNvmoFdopiAbfLElqtthukLgR0cszeFRSABgT
 cIsMFgM9tGGgkC8XmGDcF4aLcUkhvJXQur//qZISf18WqwCxVRkMc5bxcyBNDIcPPVi1
 ImMU1P1PdcORxDqF83FHyzMuo2evny5Ab5s/EkKXGlMONqoN0XrqiYztAcBIeEwAZxYW
 opYG1JqAyKmpi0FJGCaHdM/z/MmkBhGEZq1XREso9avfug7+P1Zbij3GEPY646+MF2Uf
 izHg==
X-Gm-Message-State: ANhLgQ1fqSCP9Jgu0QM1kklCsSeWnfZduVDUP/O/khbA+e6msZWztbzr
 IbqApWMVjbParHluzA/rflZ8TGOe8es=
X-Google-Smtp-Source: ADFU+vt+eNgeMdW8z+nYMrd8Bxe7xSf0Y8oplVFQFkTzkOPeN1bEt3y5GLgzl+F32+wHlT+zM65jyA==
X-Received: by 2002:a1c:1d88:: with SMTP id d130mr3473216wmd.138.1583926580522; 
 Wed, 11 Mar 2020 04:36:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c8sm61650537wru.7.2020.03.11.04.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 04:36:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] ASoC: wsa881x: mark read_only_wordlength flag
Date: Wed, 11 Mar 2020 11:35:45 +0000
Message-Id: <20200311113545.23773-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
References: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
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

WSA881x works in PDM mode so the wordlength is fixed, which also makes
the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
Writing to this register will throw up errors with Qualcomm Controller.
So use ro_blockctrl1_reg flag to mark this field as read-only so that
core will not write to this register.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index b59f1d0e7f84..35b44b297f9e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -394,6 +394,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* COMP */
 		.num = 2,
@@ -401,6 +402,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* BOOST */
 		.num = 3,
@@ -408,6 +410,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* VISENSE */
 		.num = 4,
@@ -415,6 +418,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}
 };
 
-- 
2.21.0

