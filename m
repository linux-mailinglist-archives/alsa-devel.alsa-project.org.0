Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77AA12564
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 02:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6AD182B;
	Fri,  3 May 2019 02:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6AD182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556842696;
	bh=wFaMqEACMmyHDzfyuOlf3H9YcYcivq9PQTxlmT+XUd4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cqz8gAD+6MSjyXX9mWMZPWT2s1Iq1EzY+Gidmwbj1xz2bzi5Wt9zEHVQ6W9zbgvyy
	 a3x+1EzMWF7vDAwgiKM45goj6RuIYaX7zNY3PBiRgwkB3CmFWJ/DjnP5zy2Ybpi3mh
	 k2HbPpIh2rhgu4l1ZQbjDDnzCgiC1EnSNIqWsGBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F02A6F896C7;
	Fri,  3 May 2019 02:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BCC2F896C7; Fri,  3 May 2019 02:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 714B7F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 02:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 714B7F8075A
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 17:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,423,1549958400"; d="scan'208";a="296540206"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 02 May 2019 17:16:21 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hMLsC-000IgE-UU; Fri, 03 May 2019 08:16:20 +0800
Date: Fri, 3 May 2019 08:15:43 +0800
From: kbuild test robot <lkp@intel.com>
To: Simon Ho <simon.ho@conexant.com>
Message-ID: <201905030839.woSHsder%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 kbuild-all@01.org
Subject: [alsa-devel] [sound:topic/soc-cx2072x-5.2 1/2]
 sound/soc/codecs/cx2072x.c:597:18: sparse: sparse: cast to restricted
 __le32
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/soc-cx2072x-5.2
head:   19e7a6a1d903117b3f4520690e7f399a53852c44
commit: b3d0d3217c3c84b473918b74c33f2d626c49d267 [1/2] ASoC: Add support for Conexant CX2071X CODEC
reproduce:
        # apt-get install sparse
        git checkout b3d0d3217c3c84b473918b74c33f2d626c49d267
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/codecs/cx2072x.c:597:18: sparse: sparse: cast to restricted __le32

vim +597 sound/soc/codecs/cx2072x.c

   564	
   565	static int cx2072x_reg_read(void *context, unsigned int reg,
   566				    unsigned int *value)
   567	{
   568		struct i2c_client *client = context;
   569		struct device *dev = &client->dev;
   570		unsigned int recv_buf = 0;
   571		struct i2c_msg msgs[2];
   572		unsigned int size;
   573		u8 send_buf[2];
   574		int ret;
   575	
   576		size = cx2072x_register_size(reg);
   577	
   578		send_buf[0] = reg >> 8;
   579		send_buf[1] = reg & 0xff;
   580	
   581		msgs[0].addr = client->addr;
   582		msgs[0].len = sizeof(send_buf);
   583		msgs[0].buf = send_buf;
   584		msgs[0].flags = 0;
   585	
   586		msgs[1].addr = client->addr;
   587		msgs[1].len = size;
   588		msgs[1].buf = (u8 *)&recv_buf;
   589		msgs[1].flags = I2C_M_RD;
   590	
   591		ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
   592		if (ret != ARRAY_SIZE(msgs)) {
   593			dev_err(dev, "Failed to read register, ret = %d\n", ret);
   594			return ret < 0 ? ret : -EIO;
   595		}
   596	
 > 597		*value = le32_to_cpu(recv_buf);
   598		return 0;
   599	}
   600	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
