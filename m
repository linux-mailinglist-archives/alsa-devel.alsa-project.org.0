Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB57712FB1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 00:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789051F7;
	Sat, 27 May 2023 00:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789051F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685138637;
	bh=NJB9Dl/lG+QIri0DbLOrIHYlvXISnwJTexYGyCXLVw8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FlQaZVET7rFdedbo5xHOCiAfYgltQ5dV7GFKqQ7PIFF8MrfmEUzKjX+xX98FTFdfg
	 qUIjX/NPd9S7Izx5+pUk6pLzIeFS4ImIQtD8/JnvjfcQCejaL1/TuXM4aFsxGEHCs6
	 6jAypEowncBaoWOVLfbJi+2imksVdyXskBGZHOYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B8BF800DF; Sat, 27 May 2023 00:03:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7301EF8016A;
	Sat, 27 May 2023 00:03:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E31AAF80249; Sat, 27 May 2023 00:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD1BF800DF
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 00:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD1BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EP2cbtD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685138573; x=1716674573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJB9Dl/lG+QIri0DbLOrIHYlvXISnwJTexYGyCXLVw8=;
  b=EP2cbtD3v/1F+BMF0VCrD0npyUc3b044p/qfSJoCTOBw7q14p8SrL1Sh
   enPnGznxndzT9uff8DGLgH7Z032r0A0/g/Eh6DmKNobARX6YXVUmIF86b
   u3WdgQeHWoRZ3ZT7Q621CRTrFhGte/CmIqJvti7AlwPKeOSZ9bFwrb3KK
   tq5XjJyMfq4mLDHY7+7/oZlWwEWypLZ+ijDnRWon0xXN5XmfnbKNDnQuV
   lBdbYOF9rvVFpH4vX1sr/RoHfEDVyt11XLRYMf0SQpyD+4Il1ZlMWJTN+
   pdm+PIgjngnbY7xOrDSW6WKjc6FNmILhHmSOCR4n7nO4oxTjOwmS/kPxI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351822080"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="351822080"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699542639"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="699542639"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 May 2023 15:02:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2fWH-000Jcg-0K;
	Fri, 26 May 2023 22:02:45 +0000
Date: Sat, 27 May 2023 06:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:topic/midi20 9/40] sound/usb/midi2.c:548:16: sparse:
 sparse: cast to restricted __le16
Message-ID: <202305270534.odwHL9F0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: V3IG5YRUO7RNA2CA7SCGW2H6HCZ6OXH7
X-Message-ID-Hash: V3IG5YRUO7RNA2CA7SCGW2H6HCZ6OXH7
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3IG5YRUO7RNA2CA7SCGW2H6HCZ6OXH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: ff49d1df79aef7580fe3ac99d17c3f886655d080 [9/40] ALSA: usb-audio: USB MIDI 2.0 UMP support
config: microblaze-randconfig-s032-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270534.odwHL9F0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=ff49d1df79aef7580fe3ac99d17c3f886655d080
        git remote add tiwai-sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
        git fetch --no-tags tiwai-sound topic/midi20
        git checkout ff49d1df79aef7580fe3ac99d17c3f886655d080
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash sound/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270534.odwHL9F0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16

vim +548 sound/usb/midi2.c

   530	
   531	/* get the full group terminal block descriptors and return the size */
   532	static int get_group_terminal_block_descs(struct snd_usb_midi2_interface *umidi)
   533	{
   534		struct usb_host_interface *hostif = umidi->hostif;
   535		struct usb_device *dev = umidi->chip->dev;
   536		struct usb_ms20_gr_trm_block_header_descriptor header = { 0 };
   537		unsigned char *data;
   538		int err, size;
   539	
   540		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
   541				      USB_REQ_GET_DESCRIPTOR,
   542				      USB_RECIP_INTERFACE | USB_TYPE_STANDARD | USB_DIR_IN,
   543				      USB_DT_CS_GR_TRM_BLOCK << 8 | hostif->desc.bAlternateSetting,
   544				      hostif->desc.bInterfaceNumber,
   545				      &header, sizeof(header));
   546		if (err < 0)
   547			return err;
 > 548		size = __le16_to_cpu(header.wTotalLength);
   549		if (!size) {
   550			dev_err(&dev->dev, "Failed to get GTB descriptors for %d:%d\n",
   551				hostif->desc.bInterfaceNumber, hostif->desc.bAlternateSetting);
   552			return -EINVAL;
   553		}
   554	
   555		data = kzalloc(size, GFP_KERNEL);
   556		if (!data)
   557			return -ENOMEM;
   558	
   559		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
   560				      USB_REQ_GET_DESCRIPTOR,
   561				      USB_RECIP_INTERFACE | USB_TYPE_STANDARD | USB_DIR_IN,
   562				      USB_DT_CS_GR_TRM_BLOCK << 8 | hostif->desc.bAlternateSetting,
   563				      hostif->desc.bInterfaceNumber, data, size);
   564		if (err < 0) {
   565			kfree(data);
   566			return err;
   567		}
   568	
   569		umidi->blk_descs = data;
   570		umidi->blk_desc_size = size;
   571		return 0;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
