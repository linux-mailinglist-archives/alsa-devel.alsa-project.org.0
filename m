Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01C665175
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 03:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7FA781C;
	Wed, 11 Jan 2023 03:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7FA781C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673402639;
	bh=5xNSLWQZErPPGbN6PdCvmcZ6GohWnmEdvcDaz0ync1g=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u9J+aBHluGHlGv7CY+EFMTBZ+qOLBo7Iu/KOPovHMEMWj3oETn5A8lpOmfmGcyYFA
	 mVcWXyR1Rkwv/NkFn3NsAr8T/frnIcjEXGezcFRY9JkcddA9NSkg8QKIXvW1iPx0Nv
	 PIxnGoZ+MQf4rz27IMzTseURmYMZeBgi7M6mYQrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BA4F800C7;
	Wed, 11 Jan 2023 03:03:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C037F804C1; Wed, 11 Jan 2023 03:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out29-128.mail.aliyun.com (out29-128.mail.aliyun.com
 [115.124.29.128])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 248BBF800C7
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 03:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 248BBF800C7
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07457647|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00142299-6.55096e-05-0.998511;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=29; RT=29; SR=0; TI=SMTPD_---.Qpjh-Tl_1673402554; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Qpjh-Tl_1673402554) by smtp.aliyun-inc.com;
 Wed, 11 Jan 2023 10:02:46 +0800
From: wangweidong.a@awinic.com
To: lkp@intel.com
Subject: Re: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file,
 data type file and Kconfig Makefile
Date: Wed, 11 Jan 2023 10:02:33 +0800
Message-Id: <20230111020233.4306-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <202301100233.QuEJ8pyu-lkp@intel.com>
References: <202301100233.QuEJ8pyu-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, steve@sk2.org, llvm@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 yangxiaohua@everest-semi.com, daniel.beer@igorinstitute.com,
 pierre-louis.bossart@linux.intel.com, povik+lin@cutebit.org,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 zhaolei@awinic.com, james.schulman@cirrus.com, rf@opensource.cirrus.com,
 robh+dt@kernel.org, oe-kbuild-all@lists.linux.dev, jonathan.albrieux@gmail.com,
 tiwai@suse.com, liweilei@awinic.com, wangweidong.a@awinic.com,
 lgirdwood@gmail.com, yijiangtao@awinic.com, broonie@kernel.org,
 13691752556@139.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/01/2023 03:00, kernel test robot wrote:
> Hi,

> Thank you for the patch! Yet something to improve:

> [auto build test ERROR on 1f5abbd77e2c1787e74b7c2caffac97def78ba52]

> url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-codecs-Add-i2c-and-codec-registration-for-aw883xx-and-their-associated-operation-functions/20230106-113130
> base:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
> patch link:    https://lore.kernel.org/r/20230106032835.141918-5-wangweidong.a%40awinic.com
> patch subject: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file, data type file and Kconfig Makefile
> config: arm64-randconfig-r034-20230109
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> reproduce (this is a W=1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # install arm64 cross compiling tool for clang build
>        # apt-get install binutils-aarch64-linux-gnu
>        # https://github.com/intel-lab-lkp/linux/commit/63bed80c0eacb29f78eb53987b34863bafd48cee
>        git remote add linux-review https://github.com/intel-lab-lkp/linux
>        git fetch --no-tags linux-review wangweidong-a-awinic-com/ASoC-codecs-Add-i2c-and-codec-registration-for-aw883xx-and-their-associated-operation-functions/20230106-113130
>        git checkout 63bed80c0eacb29f78eb53987b34863bafd48cee
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

> All errors (new ones prefixed by >>):

> >> ld.lld: error: undefined symbol: crc8_populate_lsb
>   >>> referenced by aw883xx_bin_parse.c:1049 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1049)
>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
> --
> >> ld.lld: error: undefined symbol: crc8
>   >>> referenced by aw883xx_bin_parse.c:963 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:963)
>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
>   >>> referenced by aw883xx_bin_parse.c:1022 (sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1022)
>   >>>               vmlinux.o:(aw883xx_dev_load_acf_check)
>   >>> did you mean: crc4
>   >>> defined in: vmlinux.o

This looks like a false positive. crc8_populate_lsb is defined in the lib/crc8.c file.
I also could not reproduce it with GCC.

Best regards,
Weidong Wang
