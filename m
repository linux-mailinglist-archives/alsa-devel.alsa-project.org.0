Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B394CF952
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19C282B;
	Tue,  8 Oct 2019 14:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19C282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570536524;
	bh=RxWQc1N8UOOc+KdsmyFR17jWsuJN4CX+afDC5aGooB0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1y31UPKKuwyaBunVTMb1Ekj3W+GXfGL1wMHT/lRMMowPzqhXt2LfRpXJ2o1O5aZ6
	 W39tuFfsyYnVxUm6kki+6yGEPhAjkJFUBCrCWC6g+Say8gsseRTHN1uqqMSCB81RcJ
	 xykUc3IIWglUPgNncdSNrcc2S7dollbzEB5QFnpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F25F8038F;
	Tue,  8 Oct 2019 14:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2F19F8038F; Tue,  8 Oct 2019 14:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09B3F80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09B3F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q5WIB6Zn"
Received: from localhost (92-111-67-33.static.v4.ziggozakelijk.nl
 [92.111.67.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF2C3206C2;
 Tue,  8 Oct 2019 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570536412;
 bh=Uj5x6J2gH97vDiZFnRpH5rNfDhiBDOr6x+X7q7iJ0jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5WIB6Znd6MmUFiZe7cgph9CBc1fO+biOlU76MaIEDNoUNutRckaP5t2Mm/TuJqDL
 hZEp9E9sM4a0nfrAhj/SvTFS+aWmGcwUdO7KNlJL+H6BYWG0F7pX61N9N98tq/NcQi
 KU49X+7gCqZLnPY/GrThfiKaOrzaW1+JYR1bKFuc=
Date: Tue, 8 Oct 2019 14:06:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20191008120649.GC2761030@kroah.com>
References: <20191008101144.39342-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008101144.39342-1-cychiang@chromium.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tzungbi@chromium.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Hung-Te Lin <hungte@chromium.org>, sathya.prakash.m.r@intel.com,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Shuming Fan <shumingf@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, dgreid@chromium.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH v2] firmware: vpd: Add an interface to read
	VPD value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 08, 2019 at 06:11:44PM +0800, Cheng-Yi Chiang wrote:
> Add an interface for other driver to query VPD value.
> This will be used for ASoC machine driver to query calibration
> data stored in VPD for smart amplifier speaker resistor
> calibration.
> 
> The example usage in ASoC machine driver is like:
> 
> #define DSM_CALIB_KEY "dsm_calib"
> static int load_calibration_data(struct cml_card_private *ctx) {
>     char *data = NULL;
>     int ret;
>     u32 value_len;
> 
>     /* Read calibration data from VPD. */
>     ret = vpd_attribute_read(1, DSM_CALIB_KEY,
>                             (u8 **)&data, &value_len);
> 
>     /* Parsing of this string...*/
> }
> 
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---

I can't take this patch without a real user of this function in the
kernel tree at the same time.  Please submit it as part of a patch
series with that change as well.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
