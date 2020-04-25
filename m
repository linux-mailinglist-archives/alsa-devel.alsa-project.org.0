Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756001B8A32
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 01:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175BF16A2;
	Sun, 26 Apr 2020 01:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175BF16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587859009;
	bh=laet9lG5pNC7nqpoDAQ0Z2lc0FcaQaBbeKa8MBDAujg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SpRW/AG6VGG2RRNFValx7iPCruYUzjyAQ4ew1KLOL8c+DdeX87CRGa0O47Wmq03qz
	 ncEVwZvl+XKn42wNawQNR50Rm06c2D9FR1mh1BmA0feaVyfM9S6xUX90pbFhKnkKau
	 ltZooq8Hx4vBHPhhOOI3Mg7n7a6s6gMLnDNAoe/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31ACCF80159;
	Sun, 26 Apr 2020 01:55:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FBEF801EC; Sun, 26 Apr 2020 01:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD1CF80116
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 01:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD1CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HZAznOdR"
Received: by mail-wm1-x344.google.com with SMTP id e26so15506000wmk.5
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kIF3Ha6AYtF1LF/TcQJoOGghWoQ3P/dbZp/m08LM174=;
 b=HZAznOdRkWHcoD8g5JCei5bVBsT1NPftaaC9tjiIJmMhUcPwweKTLoa/qam0jU5LZn
 ipC6GIOCoIJCJRpyrDryP61fpLhvjTiIa2nDyUo0fdUkXirVGUr6bf41le9zK13zwKqH
 sdAbwGgJLCAEHvSrz3BLFPEc4rsIJG9RPIiiUZp6JOLkMmuXqwrzJ34uTxEKAgTTbylX
 tdDhJWMD92D4g1wDmOpqWvc0kTU3rfFaOGA9DZvK15vG7sR9jiBZOvfnQu98KazP9e7M
 FOoPivK+0aT+j3FUc8Zd4zCMDruhEBhdovUuUvr3wVL0PlE++IJfsFCLF0b09OU6R5tU
 U+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kIF3Ha6AYtF1LF/TcQJoOGghWoQ3P/dbZp/m08LM174=;
 b=aG7B5NfJ6MxIQOcZb4c0+bPFL4n6wc7i9upb/Vmpib+QLS5KkCJCTERgt/601N6zfJ
 YK12/uH/qZHvQpHzuhPGBWZyXqj99DrMe5IOoGmcH6gyzwKKXn2nUnv9fWU18hb3MCI4
 PnFYABzb8+eDRXWY8K+f37TMvf3X4jdxOVg+rtsV1ZVJJD3kifHN+hb2hmBIKwc1vXzW
 Ix2qHpWXEsaQxW+CQN03dpGGViXwS8MmI4q6a+uugXy1Qojy/89oEYYUhJMdsg0Kpujz
 M98Rxn+J23ODpAMiPdPlXYf/4R+xUb+GBibvlD5tY/FfhENAnhj5PmUXskqW/6UzxTah
 5r7A==
X-Gm-Message-State: AGi0Pubg7ps9jve6swdkvuVTLzY+xLv1MXl+EX0w/1nVLKmCMIC9YaW9
 U3yYPsZU6bkKYz3FxOxP+Yk=
X-Google-Smtp-Source: APiQypK/wShvy0FpwtkXE6nfjCogbfBy0VzPVy606nMddpf2hdyc+NEUMEkRaYasZpK1LpqzhKj59Q==
X-Received: by 2002:a1c:9a81:: with SMTP id
 c123mr17298439wme.115.1587858890068; 
 Sat, 25 Apr 2020 16:54:50 -0700 (PDT)
Received: from debian.lan (host-84-13-17-86.opaltelecom.net. [84.13.17.86])
 by smtp.gmail.com with ESMTPSA id g74sm9140037wme.44.2020.04.25.16.54.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Apr 2020 16:54:49 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2] soundwire: intel: Remove unused function
Date: Sun, 26 Apr 2020 00:54:48 +0100
Message-Id: <20200425235448.3946-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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

The function sdw_intel_init() is not used anywhere, remove it for now.
And that makes sdw_intel_add_controller(), sdw_intel_acpi_cb() and
link_mask unused, so remove them as well.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/soundwire/intel_init.c | 162 -----------------------------------------
 1 file changed, 162 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad7053463889..d90929a5043b 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -23,10 +23,6 @@
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
-static int link_mask;
-module_param_named(sdw_link_mask, link_mask, int, 0444);
-MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
-
 static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 {
 	struct sdw_intel_link_res *link = ctx->links;
@@ -47,164 +43,6 @@ static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-static struct sdw_intel_ctx
-*sdw_intel_add_controller(struct sdw_intel_res *res)
-{
-	struct platform_device_info pdevinfo;
-	struct platform_device *pdev;
-	struct sdw_intel_link_res *link;
-	struct sdw_intel_ctx *ctx;
-	struct acpi_device *adev;
-	int ret, i;
-	u8 count;
-	u32 caps;
-
-	if (acpi_bus_get_device(res->handle, &adev))
-		return NULL;
-
-	/* Found controller, find links supported */
-	count = 0;
-	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
-					    "mipi-sdw-master-count", &count, 1);
-
-	/* Don't fail on error, continue and use hw value */
-	if (ret) {
-		dev_err(&adev->dev,
-			"Failed to read mipi-sdw-master-count: %d\n", ret);
-		count = SDW_MAX_LINKS;
-	}
-
-	/* Check SNDWLCAP.LCOUNT */
-	caps = ioread32(res->mmio_base + SDW_SHIM_BASE + SDW_SHIM_LCAP);
-	caps &= GENMASK(2, 0);
-
-	/* Check HW supported vs property value and use min of two */
-	count = min_t(u8, caps, count);
-
-	/* Check count is within bounds */
-	if (count > SDW_MAX_LINKS) {
-		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
-			count, SDW_MAX_LINKS);
-		return NULL;
-	} else if (!count) {
-		dev_warn(&adev->dev, "No SoundWire links detected\n");
-		return NULL;
-	}
-
-	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
-
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return NULL;
-
-	ctx->count = count;
-	ctx->links = kcalloc(ctx->count, sizeof(*ctx->links), GFP_KERNEL);
-	if (!ctx->links)
-		goto link_err;
-
-	link = ctx->links;
-
-	/* Create SDW Master devices */
-	for (i = 0; i < count; i++) {
-		if (link_mask && !(link_mask & BIT(i))) {
-			dev_dbg(&adev->dev,
-				"Link %d masked, will not be enabled\n", i);
-			link++;
-			continue;
-		}
-
-		link->registers = res->mmio_base + SDW_LINK_BASE
-					+ (SDW_LINK_SIZE * i);
-		link->shim = res->mmio_base + SDW_SHIM_BASE;
-		link->alh = res->mmio_base + SDW_ALH_BASE;
-
-		link->ops = res->ops;
-		link->dev = res->dev;
-
-		memset(&pdevinfo, 0, sizeof(pdevinfo));
-
-		pdevinfo.parent = res->parent;
-		pdevinfo.name = "int-sdw";
-		pdevinfo.id = i;
-		pdevinfo.fwnode = acpi_fwnode_handle(adev);
-
-		pdev = platform_device_register_full(&pdevinfo);
-		if (IS_ERR(pdev)) {
-			dev_err(&adev->dev,
-				"platform device creation failed: %ld\n",
-				PTR_ERR(pdev));
-			goto pdev_err;
-		}
-
-		link->pdev = pdev;
-		link++;
-	}
-
-	return ctx;
-
-pdev_err:
-	sdw_intel_cleanup_pdev(ctx);
-link_err:
-	kfree(ctx);
-	return NULL;
-}
-
-static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
-				     void *cdata, void **return_value)
-{
-	struct sdw_intel_res *res = cdata;
-	struct acpi_device *adev;
-	acpi_status status;
-	u64 adr;
-
-	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
-	if (ACPI_FAILURE(status))
-		return AE_OK; /* keep going */
-
-	if (acpi_bus_get_device(handle, &adev)) {
-		pr_err("%s: Couldn't find ACPI handle\n", __func__);
-		return AE_NOT_FOUND;
-	}
-
-	res->handle = handle;
-
-	/*
-	 * On some Intel platforms, multiple children of the HDAS
-	 * device can be found, but only one of them is the SoundWire
-	 * controller. The SNDW device is always exposed with
-	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
-	 * SoundWire link so filter accordingly
-	 */
-	if ((adr & GENMASK(31, 28)) >> 28 != SDW_LINK_TYPE)
-		return AE_OK; /* keep going */
-
-	/* device found, stop namespace walk */
-	return AE_CTRL_TERMINATE;
-}
-
-/**
- * sdw_intel_init() - SoundWire Intel init routine
- * @parent_handle: ACPI parent handle
- * @res: resource data
- *
- * This scans the namespace and creates SoundWire link controller devices
- * based on the info queried.
- */
-static void *sdw_intel_init(acpi_handle *parent_handle,
-			    struct sdw_intel_res *res)
-{
-	acpi_status status;
-
-	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
-				     parent_handle, 1,
-				     sdw_intel_acpi_cb,
-				     NULL, res, NULL);
-	if (ACPI_FAILURE(status))
-		return NULL;
-
-	return sdw_intel_add_controller(res);
-}
-
 /**
  * sdw_intel_exit() - SoundWire Intel exit
  * @arg: callback context
-- 
2.11.0

