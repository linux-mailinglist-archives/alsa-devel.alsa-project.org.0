Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574642A7619
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 04:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7551670;
	Thu,  5 Nov 2020 04:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7551670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604547280;
	bh=6nds5KCJylQ/cnzJDTiOWmMtO3021Y3W1zTUGuQAaAg=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPxjcITJHqHq2kN5X27+pRi7MyE6uHs9m8nNR3eOrFLD8wMrZLUbOusXpLeM0Fsj0
	 utt7Dob2gh7NLtqWlW2BnQP/h3pOuHGyxnNY2BSh1tqbHFS70KI7AhQmSr8Y4+JMsy
	 a2GFAQgdf0mEVptvqA5YNizIfIvtkhmM/wAYkh2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57689F80245;
	Thu,  5 Nov 2020 04:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5B3F80171; Thu,  5 Nov 2020 04:33:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80DA6F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 04:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DA6F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XOxtkBzE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=L3zOV15Bgjs3dnrs7SWT24aj9bdUSoUf03dVFP7rC+4=; b=XOxtkBzEqqYW150pcncGSvuHXS
 AZyPuH+5NwACs7WgWDKJp+HnLDPPS/CWqwL/cxRUOGLBoFpYwpqXJeCUwg4BzK4jrBw3KGgtOaq/4
 /cf7XDvV05NYAKkh7F9X+9JbiBJH864zOgKyn5tgzH07c4gugCo2rMjb3Mrmu++9oXhR7sXo3Ggte
 Jt/39g3UobuFppScyctrkENIVne8YVpApB+FQF1rEFJ5r98DFazPPQUWCYhnI/PCnkRB3yHMq4XZx
 5JAQpmVJOYS+WEi8XYjMrlqne5XCm5SX5HG+rcIqMK8v4lzgyCwDthGfytmYrHUPAzgtsdzoYlekA
 YnzYAdZw==;
Received: from [2601:1c0:6280:3f0::60d5]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW10-0005wQ-Kb; Thu, 05 Nov 2020 03:32:48 +0000
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
To: kernel test robot <lkp@intel.com>, Jonathan Marek <jonathan@marek.ca>
References: <202011030351.iq9CBMO3-lkp@intel.com>
Message-ID: <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
Date: Wed, 4 Nov 2020 19:32:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <202011030351.iq9CBMO3-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
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

On 11/2/20 11:47 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3cea11cd5e3b00d91caf0b4730194039b45c5891
> commit: 09309093d5e8f8774e4a3a0d42b73cf47e9421cf soundwire: qcom: fix SLIBMUS/SLIMBUS typo
> date:   8 weeks ago
> config: openrisc-randconfig-r005-20201102 (attached as .config)
> compiler: or1k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09309093d5e8f8774e4a3a0d42b73cf47e9421cf
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 09309093d5e8f8774e4a3a0d42b73cf47e9421cf
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=openrisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    or1k-linux-ld: drivers/soundwire/qcom.o: in function `qcom_swrm_probe':
>>> drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
>>> or1k-linux-ld: drivers/soundwire/qcom.c:771: undefined reference to `slimbus_bus'
> 
> vim +767 drivers/soundwire/qcom.c
> 
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  756  
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  757  static int qcom_swrm_probe(struct platform_device *pdev)
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  758  {
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  759  	struct device *dev = &pdev->dev;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  760  	struct sdw_master_prop *prop;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  761  	struct sdw_bus_params *params;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  762  	struct qcom_swrm_ctrl *ctrl;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  763  	int ret;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  764  	u32 val;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  765  
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  766  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13 @767  	if (!ctrl)
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  768  		return -ENOMEM;
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13  769  
> 09309093d5e8f87 Jonathan Marek       2020-09-08  770  #if IS_ENABLED(CONFIG_SLIMBUS)
> 02efb49aa805cee Srinivas Kandagatla  2020-01-13 @771  	if (dev->parent->bus == &slimbus_bus) {
> 5bd773242f75da3 Jonathan Marek       2020-09-05  772  #else
> 5bd773242f75da3 Jonathan Marek       2020-09-05  773  	if (false) {
> 5bd773242f75da3 Jonathan Marek       2020-09-05  774  #endif

> :::::: The code at line 767 was first introduced by commit
> :::::: 02efb49aa805cee643a643ab61a1118c2fd08b80 soundwire: qcom: add support for SoundWire controller
> 
> :::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> :::::: CC: Vinod Koul <vkoul@kernel.org>


config SOUNDWIRE_QCOM
	tristate "Qualcomm SoundWire Master driver"
	imply SLIMBUS
	depends on SND_SOC

The kernel config that was attached has:
CONFIG_SOUNDWIRE_QCOM=y
CONFIG_SLIMBUS=m

I expected that "imply" would make SLIMBUS=y since SOUNDWIRE_QCOM=y,
but I guess that's not the case. :(

Any ideas about what to do here?

-- 
~Randy

