Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9B2A2050
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 18:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFBC16B3;
	Sun,  1 Nov 2020 18:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFBC16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604251559;
	bh=vjSbj3LnDI6Gm2YEcSRbYyYsb8O1vvApKtMTKqqiMhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xq+zgSnswEKw3GIm4Dy/Uhq155twyBCn22xQNPXO5SHyROamE+8f4AsqTilpwK64j
	 EnXJlkL6Rzz7Mt0Z+IvcM/xl4OWYv2XeEwmkTZNPEBw7WVeb+a1TkzIozF5skQV3kR
	 A+2mwQoVw9iGHAuSbymRS+etlyClAhN7kyYk8X+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26613F8015F;
	Sun,  1 Nov 2020 18:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B46DF80162; Sun,  1 Nov 2020 18:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E160F8012B
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 18:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E160F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MzkLBdXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604251460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=ar42oVriuRci3B5JCt0ie/o9rZYCCxXolg155/aarmA=;
 b=MzkLBdXyUWEgSbmKHrIAwzSMFkvlH8jElXzuxEqu8w9Rm385LyIPuLqPt9iLo/kGAXEAev
 9lGMx740rQuhXhzW6DbDTMSjAZi2gKwn50rJn+bywo6MwKuUhjym/mZ86ESo9wCec0Uvg2
 iFgUO8vWuYjeY4WzzHp3GiPLBg8JNUU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-KPVpT1sKOmuVZD-5yFC6eg-1; Sun, 01 Nov 2020 12:24:19 -0500
X-MC-Unique: KPVpT1sKOmuVZD-5yFC6eg-1
Received: by mail-ot1-f70.google.com with SMTP id k103so4926605otk.1
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 09:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ar42oVriuRci3B5JCt0ie/o9rZYCCxXolg155/aarmA=;
 b=Ls/KiTc0rRa9ncXGz2pN2CX2X59M2wndsfIuEsAPeSq0nZzov8Su/Txk7nDcI7fqGZ
 BGvyVGlehDkdY56b89ZkEmOVKeXd0gSGmqM3WJjTDaooKbO1iUegybKsGt8z94lkwSZb
 JNVE0JSV6y2pY1Gg5wq3SSkOXAKjaqOkobyroMWgtBIQz8DwSIUPkfyxTvGOg4DVDG1f
 a1cul4JOh9JuMEy73PKPfw9CiE5IExdCaeEOF2SR+rrVleMeZ13RhPQWqV//c62OOg1h
 /UjXTGIDst1iTBIIFC1EdqXtaI4mWDTwtMtSEt7Ek3yzLr8JE3SPSwtLdRe5LN0K44FL
 F62Q==
X-Gm-Message-State: AOAM532AqGKr3X89R0ZpT2EgLm40WWvs6aYNZQ+ujlXdZ07vE5VEVPKP
 1RGXnpYzUQhyloouH85JeUPEV1gXScmTGYLInmZ+6FbXR8aHJh8my6KvBvOy+H8nEM6P5zl0cMt
 v3OLqv/zt/eavnyQIiFFRCFw=
X-Received: by 2002:a05:6830:1254:: with SMTP id
 s20mr8926212otp.314.1604251458341; 
 Sun, 01 Nov 2020 09:24:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQkolyAC8MckoqHgNScKCXFlJJ5Cm2sr+AdV7ggKnHMboMeTp7z/vvKJ6QiYpG4hS1bmUcUw==
X-Received: by 2002:a05:6830:1254:: with SMTP id
 s20mr8926198otp.314.1604251458172; 
 Sun, 01 Nov 2020 09:24:18 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id g3sm2941188oif.26.2020.11.01.09.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 09:24:17 -0800 (PST)
From: trix@redhat.com
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, spujar@nvidia.com
Subject: [PATCH] ASoC: tegra: remove unneeded semicolon
Date: Sun,  1 Nov 2020 09:24:12 -0800
Message-Id: <20201101172412.2306144-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-tegra@vger.kernel.org, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/tegra/tegra186_dspk.c | 6 +++---
 sound/soc/tegra/tegra210_dmic.c | 6 +++---
 sound/soc/tegra/tegra210_i2s.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 0cbe31e2c7e9..7d9948fb2ca7 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -310,7 +310,7 @@ static bool tegra186_dspk_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra186_dspk_rd_reg(struct device *dev, unsigned int reg)
@@ -326,7 +326,7 @@ static bool tegra186_dspk_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
@@ -339,7 +339,7 @@ static bool tegra186_dspk_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra186_dspk_regmap = {
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index a661f40bc41c..ead2c99bf72e 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -322,7 +322,7 @@ static bool tegra210_dmic_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_dmic_rd_reg(struct device *dev, unsigned int reg)
@@ -338,7 +338,7 @@ static bool tegra210_dmic_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
@@ -353,7 +353,7 @@ static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra210_dmic_regmap_config = {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index a383bd5c51cd..ca31ec92e508 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -662,7 +662,7 @@ static bool tegra210_i2s_wr_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_i2s_rd_reg(struct device *dev, unsigned int reg)
@@ -682,7 +682,7 @@ static bool tegra210_i2s_rd_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
@@ -701,7 +701,7 @@ static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tegra210_i2s_regmap_config = {
-- 
2.18.1

