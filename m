Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC97BC502
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 08:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4D2E0;
	Sat,  7 Oct 2023 08:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4D2E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696660027;
	bh=CNZ0wKgDC4Gh2gjI9gy6d3502rRtBayhNQt2htM7Dow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t29P5F2YcPOXrtKxak5X4NPRHAGOxuoaTPj03dois7QYFaQnId7ARfozox7PDPS2w
	 xtO2qGKrE4aqsNz3a+vpH5XlscmXVwCDO2xDUwlM2K5fwsxnQCVYf3vo9a0i/RZ0Ga
	 Y0FE+3wuGdqwvEDLG6hvdqe1KVQHAq/AUijUDQx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A70F80553; Sat,  7 Oct 2023 08:26:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB9CF80310;
	Sat,  7 Oct 2023 08:26:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8849EF8047D; Sat,  7 Oct 2023 08:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD7EF800C1
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 08:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD7EF800C1
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 7E0F980E0;
	Sat,  7 Oct 2023 06:25:19 +0000 (UTC)
Date: Sat, 7 Oct 2023 09:25:18 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
	bcousson@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231007062518.GM34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
 <20230921121626.GT5285@atomide.com>
 <20231006102348.GK34982@atomide.com>
 <20231006213003.0fbac87a@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006213003.0fbac87a@aktux>
Message-ID-Hash: MTNWMIEF6YBJARD3CPYJZFWNWOGNJ5H5
X-Message-ID-Hash: MTNWMIEF6YBJARD3CPYJZFWNWOGNJ5H5
X-MailFrom: tony@atomide.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTNWMIEF6YBJARD3CPYJZFWNWOGNJ5H5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* Andreas Kemnade <andreas@kemnade.info> [231006 19:30]:
> On Fri, 6 Oct 2023 13:23:48 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> > Here's what I think the regression fix for omap4 clocks would be, the
> > old main_clk is not the same as the module clock that we get by default.
> > If this looks OK I'll do a similar fix also for omap5.
> > 
> > Or is something else also needed?
> > 
> 
> hmm,
> audio output works, the waring is away, but something new is here:

OK good to hear it works, I'll send out fixes for omap4 and 5, seems
the runtime PM warning is something different.

> omap-mcbsp 40124000.mcbsp: Runtime PM usage count underflow!
> # cat /sys/bus/platform/devices/40124000.mcbsp/power/runtime_status 
> active
> 
> even with no sound.

I guess if the mcbsp instance is not used, runtime PM is enabled but
pm_runtime_resume_and_get() is never called by ASoC?

If so then the following might be a fix, not familiar with runtime PM
done by ASoC though and not sure if some kind of locking would be
needed here.

Regards,

Tony

8< ------------------------
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index fdabed5133e83..b399d86f22777 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -74,14 +74,16 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
 		return 0;
 	}
 
-	pm_runtime_put_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_put_sync(mcbsp->dev);
 
 	r = clk_set_parent(mcbsp->fclk, fck_src);
 	if (r)
 		dev_err(mcbsp->dev, "CLKS: could not clk_set_parent() to %s\n",
 			src);
 
-	pm_runtime_get_sync(mcbsp->dev);
+	if (mcbsp->active)
+		pm_runtime_get_sync(mcbsp->dev);
 
 	clk_put(fck_src);
 
