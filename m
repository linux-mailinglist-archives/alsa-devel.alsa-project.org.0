Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9872C38DC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 06:53:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5F4171C;
	Wed, 25 Nov 2020 06:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5F4171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606283625;
	bh=3TsnI28YOrBSLpojTzDR4uEaUM9Fo2k4e+hHZUS++hE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFdArNCyF+y8tQcizQdurgaIvjEhIvoLK7hrIgdnjSg+hWe/GfaGvX8s2kFRacce1
	 D3tqcFvFH66lWi1kVMVhJNMEDKqDbiewtZRp9LaUS/x/aNBg4Epq2rzrbro3OREX6V
	 fJMKq1nxmkCZ2w96pRBQ/+2VHzchysincyd3VdvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEFDFF8015A;
	Wed, 25 Nov 2020 06:52:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371BFF8019D; Wed, 25 Nov 2020 06:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE14EF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 06:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE14EF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ozmQ4UeK"
Received: from localhost (unknown [122.179.120.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D646208C3;
 Wed, 25 Nov 2020 05:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606283519;
 bh=3TsnI28YOrBSLpojTzDR4uEaUM9Fo2k4e+hHZUS++hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozmQ4UeKydkeEsVKXsDHXAXgDLyMhdyo9hbJSW57EA4T2JFAxGgfIfHSc0AO9+0nv
 HN7EfuvDo1Swl83LcA+xeGveMXmbBpo5SfotKOoB3RsgXdmG8pRYaBHsfo9ncof989
 X5WxCc2e3ci6W+SjH0Ilc1bHmTjIk7ACFPTIDdfM=
Date: Wed, 25 Nov 2020 11:21:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
Message-ID: <20201125055155.GD8403@vkoul-mobl>
References: <202011030351.iq9CBMO3-lkp@intel.com>
 <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Hi Randy,

On 04-11-20, 19:32, Randy Dunlap wrote:
> On 11/2/20 11:47 AM, kernel test robot wrote:
> > All errors (new ones prefixed by >>):
> > 
> >    or1k-linux-ld: drivers/soundwire/qcom.o: in function `qcom_swrm_probe':
> >>> drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
> >>> or1k-linux-ld: drivers/soundwire/qcom.c:771: undefined reference to `slimbus_bus'
> > 
> > 09309093d5e8f87 Jonathan Marek       2020-09-08  770  #if IS_ENABLED(CONFIG_SLIMBUS)
> > 02efb49aa805cee Srinivas Kandagatla  2020-01-13 @771  	if (dev->parent->bus == &slimbus_bus) {
> > 5bd773242f75da3 Jonathan Marek       2020-09-05  772  #else
> > 5bd773242f75da3 Jonathan Marek       2020-09-05  773  	if (false) {
> > 5bd773242f75da3 Jonathan Marek       2020-09-05  774  #endif
> 
> config SOUNDWIRE_QCOM
> 	tristate "Qualcomm SoundWire Master driver"
> 	imply SLIMBUS
> 	depends on SND_SOC
> 
> The kernel config that was attached has:
> CONFIG_SOUNDWIRE_QCOM=y
> CONFIG_SLIMBUS=m
> 
> I expected that "imply" would make SLIMBUS=y since SOUNDWIRE_QCOM=y,
> but I guess that's not the case. :(
> 
> Any ideas about what to do here?

Sorry to have missed this earlier. I did some digging and found the
Kconfig code to be correct, but not the driver code. Per the
Documentation if we are using imply we should use IS_REACHABLE() rather
than IS_ENABLED.

This seems to take care of build failure for me on arm64 and x64 builds.

Can you confirm with below patch:

---><8---

From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 25 Nov 2020 11:15:22 +0530
Subject: [PATCH] soundwire: qcom: Fix build failure when slimbus is module

Commit 5bd773242f75 ("soundwire: qcom: avoid dependency on
CONFIG_SLIMBUS") removed hard dependency on Slimbus for qcom driver but
it results in build failure when:
CONFIG_SOUNDWIRE_QCOM=y
CONFIG_SLIMBUS=m

drivers/soundwire/qcom.o: In function `qcom_swrm_probe':
qcom.c:(.text+0xf44): undefined reference to `slimbus_bus'

Fix this by using IS_REACHABLE() in driver which is recommended to be
sued with imply.

Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fbca4ebf63e9..6d22df01f354 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -799,7 +799,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	data = of_device_get_match_data(dev);
 	ctrl->rows_index = sdw_find_row_index(data->default_rows);
 	ctrl->cols_index = sdw_find_col_index(data->default_cols);
-#if IS_ENABLED(CONFIG_SLIMBUS)
+#if IS_REACHABLE(CONFIG_SLIMBUS)
 	if (dev->parent->bus == &slimbus_bus) {
 #else
 	if (false) {
-- 
2.26.2

-- 
~Vinod
