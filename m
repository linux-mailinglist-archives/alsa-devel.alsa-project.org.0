Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014A494676
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 05:31:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3698A2F05;
	Thu, 20 Jan 2022 05:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3698A2F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642653073;
	bh=zBZPPpHMTgU+TRACFDuOmDezIH1hCkMSxXLYLVKMJZc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8HSAsq4OPHb2zvh1uDhunJKA3HtizWdKwolo3fH1yz9KDUxID1W/kjzjrP3eVt0u
	 8t/EFUvxWEkmoBVNLfUoVkc0FSv5bINDNfux7tm2MXv3T1rdvDlZGbMhN2H7mpygRY
	 42HaW/XS5a4YVMoFIeovZInJQp39pxCupfkBBs2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF590F80134;
	Thu, 20 Jan 2022 05:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 380FFF8012E; Thu, 20 Jan 2022 05:30:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5003FF800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 05:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5003FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c3WUGyb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642652997; x=1674188997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zBZPPpHMTgU+TRACFDuOmDezIH1hCkMSxXLYLVKMJZc=;
 b=c3WUGyb4mjJ9ngX38+Irv3Q1NPcJXqgqgQCNuDyIs7cGHXPl0gxcp4xu
 kkvCY6e3KQ5gDVcnS763VNfg+5i8Bsg1iQNXVl/L6+L4FfDJN42+Z27+I
 /6gGFfT/lnIeixa8Wafq9lVQl2yCrAUxTQ2Swmw0Qu32Z6PJ4wcMmrkhz
 vR4blZeQUtkMWzT7fGyA6jeywwZX1eSTPj1qWxlAa+mQWEOxkQ7HA/7PL
 taEm/QVHJhfhFh6KnNcV9YlKfP1F4pzq6owjyHhak1TPHmYV7n79gXOta
 wnpYo4lpw487Q9CQbQ3PYeNIW9XZe4TaUyX+1mudDNgnbvlVs/rw4DzEJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="242829823"
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="242829823"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 20:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,301,1635231600"; d="scan'208";a="475391627"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 19 Jan 2022 20:29:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAP52-000E03-L9; Thu, 20 Jan 2022 04:29:48 +0000
Date: Thu, 20 Jan 2022 12:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH][next] ALSA: usb-audio: scarlett2: Use struct_size()
 helper in scarlett2_usb()
Message-ID: <202201201212.O8wvhLQc-lkp@intel.com>
References: <20220120001423.GA69878@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120001423.GA69878@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
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

Hi "Gustavo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.16 next-20220118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gustavo-A-R-Silva/ALSA-usb-audio-scarlett2-Use-struct_size-helper-in-scarlett2_usb/20220120-080908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a003-20220117 (https://download.01.org/0day-ci/archive/20220120/202201201212.O8wvhLQc-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1696152f12c0a7d23ccd5e228f9d08f7bd2da83a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Gustavo-A-R-Silva/ALSA-usb-audio-scarlett2-Use-struct_size-helper-in-scarlett2_usb/20220120-080908
        git checkout 1696152f12c0a7d23ccd5e228f9d08f7bd2da83a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/usb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/usb/mixer_scarlett_gen2.c:1115:14: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                           cmd, err, resp_buf_size);
                                     ^~~~~~~~~~~~~
   sound/usb/usbaudio.h:67:36: note: expanded from macro 'usb_audio_err'
           dev_err(&(chip)->dev->dev, fmt, ##args)
                                      ~~~    ^~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1115 sound/usb/mixer_scarlett_gen2.c

1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1056  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1057  /* Send a proprietary format request to the Scarlett interface */
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1058  static int scarlett2_usb(
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1059  	struct usb_mixer_interface *mixer, u32 cmd,
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1060  	void *req_data, u16 req_size, void *resp_data, u16 resp_size)
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1061  {
e46f2195c86b00 Geoffrey D. Bennett 2021-06-21  1062  	struct scarlett2_data *private = mixer->private_data;
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1063  	struct usb_device *dev = mixer->chip->dev;
b677b6c6d82248 Geoffrey D. Bennett 2021-06-21  1064  	struct scarlett2_usb_packet *req, *resp = NULL;
1696152f12c0a7 Gustavo A. R. Silva 2022-01-19  1065  	size_t req_buf_size = struct_size(req, data, req_size);
1696152f12c0a7 Gustavo A. R. Silva 2022-01-19  1066  	size_t resp_buf_size = struct_size(resp, data, resp_size);
b677b6c6d82248 Geoffrey D. Bennett 2021-06-21  1067  	int err;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1068  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1069  	req = kmalloc(req_buf_size, GFP_KERNEL);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1070  	if (!req) {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1071  		err = -ENOMEM;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1072  		goto error;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1073  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1074  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1075  	resp = kmalloc(resp_buf_size, GFP_KERNEL);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1076  	if (!resp) {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1077  		err = -ENOMEM;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1078  		goto error;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1079  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1080  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1081  	mutex_lock(&private->usb_mutex);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1082  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1083  	/* build request message and send it */
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1084  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1085  	scarlett2_fill_request_header(private, req, cmd, req_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1086  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1087  	if (req_size)
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1088  		memcpy(req->data, req_data, req_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1089  
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1090  	err = scarlett2_usb_tx(dev, private->bInterfaceNumber,
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1091  			       req, req_buf_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1092  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1093  	if (err != req_buf_size) {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1094  		usb_audio_err(
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1095  			mixer->chip,
4be47798d76e6e Geoffrey D. Bennett 2021-06-23  1096  			"Scarlett Gen 2/3 USB request result cmd %x was %d\n",
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1097  			cmd, err);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1098  		err = -EINVAL;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1099  		goto unlock;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1100  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1101  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1102  	/* send a second message to get the response */
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1103  
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1104  	err = scarlett2_usb_rx(dev, private->bInterfaceNumber,
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1105  			       SCARLETT2_USB_CMD_RESP,
1f7fa6e5afbf20 Geoffrey D. Bennett 2021-06-22  1106  			       resp, resp_buf_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1107  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1108  	/* validate the response */
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1109  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1110  	if (err != resp_buf_size) {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1111  		usb_audio_err(
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1112  			mixer->chip,
4be47798d76e6e Geoffrey D. Bennett 2021-06-23  1113  			"Scarlett Gen 2/3 USB response result cmd %x was %d "
1696152f12c0a7 Gustavo A. R. Silva 2022-01-19  1114  			"expected %lu\n",
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22 @1115  			cmd, err, resp_buf_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1116  		err = -EINVAL;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1117  		goto unlock;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1118  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1119  
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1120  	/* cmd/seq/size should match except when initialising
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1121  	 * seq sent = 1, response = 0
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1122  	 */
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1123  	if (resp->cmd != req->cmd ||
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1124  	    (resp->seq != req->seq &&
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1125  		(le16_to_cpu(req->seq) != 1 || resp->seq != 0)) ||
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1126  	    resp_size != le16_to_cpu(resp->size) ||
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1127  	    resp->error ||
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1128  	    resp->pad) {
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1129  		usb_audio_err(
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1130  			mixer->chip,
4be47798d76e6e Geoffrey D. Bennett 2021-06-23  1131  			"Scarlett Gen 2/3 USB invalid response; "
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1132  			   "cmd tx/rx %d/%d seq %d/%d size %d/%d "
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1133  			   "error %d pad %d\n",
d8f489355cff55 Takashi Iwai        2020-02-01  1134  			le32_to_cpu(req->cmd), le32_to_cpu(resp->cmd),
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1135  			le16_to_cpu(req->seq), le16_to_cpu(resp->seq),
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1136  			resp_size, le16_to_cpu(resp->size),
d8f489355cff55 Takashi Iwai        2020-02-01  1137  			le32_to_cpu(resp->error),
d8f489355cff55 Takashi Iwai        2020-02-01  1138  			le32_to_cpu(resp->pad));
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1139  		err = -EINVAL;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1140  		goto unlock;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1141  	}
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1142  
acf91b8122c7f6 Geoffrey D. Bennett 2021-06-22  1143  	if (resp_data && resp_size > 0)
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1144  		memcpy(resp_data, resp->data, resp_size);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1145  
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1146  unlock:
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1147  	mutex_unlock(&private->usb_mutex);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1148  error:
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1149  	kfree(req);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1150  	kfree(resp);
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1151  	return err;
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1152  }
9e4d5c1be21f0c Geoffrey D. Bennett 2019-07-29  1153  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
