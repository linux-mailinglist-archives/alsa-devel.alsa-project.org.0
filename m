Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA98C9E15
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97064E;
	Mon, 20 May 2024 15:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97064E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211467;
	bh=KhwAmAPou2kkv7BTGP/ipZ+kQymSAtsihPeeYZuhSVs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQSFFNBkVQL5705HsG43KRPLHapHmyomsePjrkDMcquU3ZbsPbtOKTcMi6TW9H1bR
	 dmNtSC46oR+VmhOmM5Ez1yJbJdV2RDmiZGXmozVX8Ozlk9hdVmkRtHvTqGgCGE4f6b
	 hWkbXqw5r2HAJ0UJ5oNvoJxM+K2Iy67LUzht0mTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97751F805FA; Mon, 20 May 2024 15:23:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4D5F805FB;
	Mon, 20 May 2024 15:23:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9438F805C0; Mon, 20 May 2024 15:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C122F80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C122F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jyZ5loay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716210256; x=1747746256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhwAmAPou2kkv7BTGP/ipZ+kQymSAtsihPeeYZuhSVs=;
  b=jyZ5loay5QtkLtQuNi2rP49sZEV6MOzik5nCOKWvI37k1IMpfK+JpXUb
   flZxEH9CInLZ5kOXX3BG6bO54IQ/IOzl3jtb5Z8xQtrGl5dU+cLsNNCR3
   XF7wEAvsk40xN2IjpBLyAVkyTF+j7lyYD1Wpn1ldQjO8gdz7+fUhFbSVy
   B+fl4DIq9G/O9k7Y5iIHIUsD5xyzIJpHgAZO4AQcsB27uz2tGVft0tzfs
   w4PwQC6KaCOD3h0CIAi/h1MoIL9hgF31gLHTAS0WUD2v15jhLXMB/plY1
   dLAcypfskXH/hmBhqVTSPnweBcg8F9sUJdNervfJs41O02ssdV06Bu/tV
   Q==;
X-CSE-ConnectionGUID: slRlOWajQga3kCIzdRyQ3Q==
X-CSE-MsgGUID: 6l9lNLERRBGYcl+G55wicw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="15210582"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000";
   d="scan'208";a="15210582"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2024 11:41:05 -0700
X-CSE-ConnectionGUID: qLgz2vTSTBCLpNIiEA+ppQ==
X-CSE-MsgGUID: u+JH4vW5TYW7ga04PS5/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000";
   d="scan'208";a="37243342"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2024 11:40:59 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8lSq-00045c-2r;
	Sun, 19 May 2024 18:40:56 +0000
Date: Mon, 20 May 2024 02:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Subject: Re: [PATCH v5 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based
 on SPI
Message-ID: <202405200222.TIIew7S6-lkp@intel.com>
References: <20240519150433.760-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519150433.760-2-baojun.xu@ti.com>
Message-ID-Hash: EGBADX42QY4BYTG4KCBPAGC6HNHGZF2C
X-Message-ID-Hash: EGBADX42QY4BYTG4KCBPAGC6HNHGZF2C
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
 andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com, shenghao-ding@ti.com,
 navada@ti.com, 13916275206@139.com, v-po@ti.com, niranjan.hy@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com, baojun.xu@ti.com,
 broonie@kernel.org, soyer@irl.hu
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ALSA-hda-tas2781-Add-tas2781-hda-driver-based-on-SPI/20240519-230843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240519150433.760-2-baojun.xu%40ti.com
patch subject: [PATCH v5 1/1] ALSA: hda/tas2781: Add tas2781 hda driver based on SPI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240520/202405200222.TIIew7S6-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200222.TIIew7S6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405200222.TIIew7S6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/tas2781_spi_fwlib.c:1225:11: warning: result of comparison of constant 13656 with expression of type 'unsigned char' is always false [-Wtautological-constant-out-of-range-compare]
    1225 |             (reg == TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG)) &&
         |              ~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/pci/hda/tas2781_spi_fwlib.c:1281:11: warning: result of comparison of constant 13660 with expression of type 'unsigned char' is always true [-Wtautological-constant-out-of-range-compare]
    1281 |             (reg <= (TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG) + 4)))
         |              ~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_spi_fwlib.c:1280:11: warning: result of comparison of constant 13656 with expression of type 'unsigned char' is always false [-Wtautological-constant-out-of-range-compare]
    1280 |             (reg >= TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG)) &&
         |              ~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_spi_fwlib.c:2112:3: warning: variable 'status' is uninitialized when used here [-Wuninitialized]
    2112 |                 status++;
         |                 ^~~~~~
   sound/pci/hda/tas2781_spi_fwlib.c:2050:12: note: initialize the variable 'status' to silence this warning
    2050 |         int status;
         |                   ^
         |                    = 0
   4 warnings generated.


vim +1225 sound/pci/hda/tas2781_spi_fwlib.c

  1206	
  1207	static int tasdev_multibytes_chksum(struct tasdevice_priv *tasdevice,
  1208		unsigned char book, unsigned char page,
  1209		unsigned char reg, unsigned int len)
  1210	{
  1211		struct tas_crc crc_data;
  1212		unsigned char crc_chksum = 0;
  1213		unsigned char nBuf1[128];
  1214		int ret = 0, i;
  1215		bool in;
  1216	
  1217		if ((reg + len - 1) > 127) {
  1218			ret = -EINVAL;
  1219			dev_err(tasdevice->dev, "firmware error\n");
  1220			goto end;
  1221		}
  1222	
  1223		if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
  1224		    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> 1225		    (reg == TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG)) &&
  1226		    (len == 4)) {
  1227			/* DSP swap command, pass */
  1228			ret = 0;
  1229			goto end;
  1230		}
  1231	
  1232		in = check_yram(&crc_data, book, page, reg, len);
  1233		if (!in)
  1234			goto end;
  1235	
  1236		if (len == 1) {
  1237			dev_err(tasdevice->dev, "firmware error\n");
  1238			ret = -EINVAL;
  1239			goto end;
  1240		}
  1241	
  1242		ret = tasdevice_spi_dev_bulk_read(tasdevice,
  1243			TASDEVICE_REG(book, page, crc_data.offset),
  1244			nBuf1, crc_data.len);
  1245		if (ret < 0)
  1246			goto end;
  1247	
  1248		for (i = 0; i < crc_data.len; i++) {
  1249			if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
  1250			    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
  1251			    ((i + crc_data.offset) >=
  1252				TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG)) &&
  1253			    ((i + crc_data.offset) <=
  1254				(TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG) + 4)))
  1255				/* DSP swap command, bypass */
  1256				continue;
  1257			else
  1258				crc_chksum += crc8(tasdevice->crc8_lkp_tbl, &nBuf1[i],
  1259					1, 0);
  1260		}
  1261	
  1262		ret = crc_chksum;
  1263	
  1264	end:
  1265		return ret;
  1266	}
  1267	
  1268	static int do_singlereg_checksum(struct tasdevice_priv *tasdevice,
  1269		unsigned char book, unsigned char page,
  1270		unsigned char reg, unsigned char val)
  1271	{
  1272		struct tas_crc crc_data;
  1273		unsigned int nData1;
  1274		int ret = 0;
  1275		bool in;
  1276	
  1277		/* DSP swap command, pass */
  1278		if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
  1279		    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
  1280		    (reg >= TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG)) &&
> 1281		    (reg <= (TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG) + 4)))
  1282			return 0;
  1283	
  1284		in = check_yram(&crc_data, book, page, reg, 1);
  1285		if (!in)
  1286			return 0;
  1287		ret = tasdevice_spi_dev_read(tasdevice,
  1288			TASDEVICE_REG(book, page, reg), &nData1);
  1289		if (ret < 0)
  1290			return ret;
  1291	
  1292		if (nData1 != val) {
  1293			dev_err(tasdevice->dev,
  1294				"B[0x%x]P[0x%x]R[0x%x] W[0x%x], R[0x%x]\n",
  1295				book, page, reg, val, nData1);
  1296			tasdevice->err_code |= ERROR_YRAM_CRCCHK;
  1297			return -EAGAIN;
  1298		}
  1299	
  1300		ret = crc8(tasdevice->crc8_lkp_tbl, &val, 1, 0);
  1301	
  1302		return ret;
  1303	}
  1304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
