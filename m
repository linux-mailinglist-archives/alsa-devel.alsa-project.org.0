Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196FF4BF964
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EFB418AF;
	Tue, 22 Feb 2022 14:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EFB418AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645536598;
	bh=cEeP3qhqX+j4Qpa1G58bk6kOeK/h7S7oMuMsUpdTtPo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pfVxZJDzVcpkDkaMZaEuux4M7gKEJ77N3NcCeX7yDWkuJPoscWCb+bi5LgsDtOeTv
	 e16VzBfECEHVNaPaVBwQ/z2jlARWTLAPHCo3o9HJb+bm5/Kl1C9iJ3/3dYsEC52PNU
	 xTfvkaE4keo9AbL9mwsTVi+6QFR2XJPtasDFiTGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5E8F80238;
	Tue, 22 Feb 2022 14:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5066FF80224; Tue, 22 Feb 2022 14:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35161F800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35161F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="YZdE+Dol"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BE8F13F1D9
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645536520;
 bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=YZdE+DolrREevb0zwGrXXvuBiOo+hE83OFfSoWIpUETtURDN5fn9YhtmQYLtx7f0S
 pzxgGlJheFXYc7mtNiKR7XBCBnBcWaTOqh2ju09EUWuS2uz+zpPvmgYbeSXQfs0J/1
 pohdp6JZKR3UTRK72xk7kmaCzJM0bf48HIFq1y/FsVpIh3RSQis5UlvUKMHPlLJXJP
 AmBQ/UKs2gwdRD6iU3kro6n38TouxgMM1jzJwggqeuWhASnYS8/+WY4RNRJozo7Zvv
 +/MdxEDyJNd5hS3oXy3AhvQEPbBeJpduY3MshxO0P6NsmoDf/O3PxosxMaA3WgITgu
 SZUSLEyWTGqgw==
Received: by mail-ed1-f69.google.com with SMTP id
 l3-20020a50cbc3000000b0041083c11173so11970510edi.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
 b=5C10GCemGhHAg7YVdC2gNYdZ567jKqLEkZwsyBqAQtJERbBeZN8egi+engAC68Oa1h
 UoneSCImQFDHnIb1DqIT0+b8mTmWrdhd8Vm5IArCL0yPpg8KTVmXtwFIGiwCovtHstE8
 rIIjEgyO5c+NFZ28lChA0DKy9pTFCiGYelEiGNf3Sk8vdSGE8MB09hOpFP6y237BhVM6
 +ADTUuxaLxh87tSUbqyDYoPkvog0SuKVNR9chWcTf6wTkiCkNUD2ktr6Wrp3iaa9MslL
 1YBMgiU5XD5OnoJleF4lkmYn6oXvIpAPI+VAHhB/x1ZyVU6k0ogWmpeNPvFGxcOHjRsD
 bWvQ==
X-Gm-Message-State: AOAM532lOA2yqqRhKhUmFDmVdt2XFkht0M1a1J/jcFmYxxML2G57gC0x
 byaFuXw/pi9+LkbNDWjH2lypng6Wznbm34J+6zkY6BUExshUvHXEKCTgOeSRaGMp26npjs8WX3P
 FXheXJF6hXoLVyQd+iV29bkaq1TAoFy9DBK7CxfVQ
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id
 rn21-20020a170906d93500b006ccfcfcc286mr19267956ejb.423.1645536520190; 
 Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrFfwlMx3wyhaWOiWMYUuCZ2Sd0V6lJlo9wHP9II92B5eFvZo3+bHsg4+GgnT5+leTtK+fA==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id
 rn21-20020a170906d93500b006ccfcfcc286mr19267945ejb.423.1645536520030; 
 Tue, 22 Feb 2022 05:28:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:28:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFT PATCH 0/3] Fix kfree() of const memory on setting driver_override
Date: Tue, 22 Feb 2022 14:27:04 +0100
Message-Id: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Hi,

Drivers still seem to use driver_override incorrectly. Perhaps my old
patch makes sense now?
https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Not tested - please review and test (e.g. by writing to dirver_override
sysfs entry with KASAN enabled).

Dependencies
============
Patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  clk: imx: scu: fix kfree() of const memory on setting driver_override
  slimbus: qcom-ngd: fix kfree() of const memory on setting
    driver_override
  rpmsg: fix kfree() of const memory on setting driver_override

 drivers/clk/imx/clk-scu.c       |  6 +++++-
 drivers/rpmsg/rpmsg_internal.h  | 12 ++++++++++--
 drivers/rpmsg/rpmsg_ns.c        | 13 +++++++++++--
 drivers/slimbus/qcom-ngd-ctrl.c |  9 ++++++++-
 4 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.32.0

