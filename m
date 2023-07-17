Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90D7561E9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E28DF5;
	Mon, 17 Jul 2023 13:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E28DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594448;
	bh=Sl5Gsnd/CL3gcj6qWMkwkSdpO5F+uG8kVcdae82rkJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tKKkoMnPApTm5f4qKwSfOPyP/wuTF+rHNrBpXFb2EBQr+RTkpxUqjH29hIa+H2T8F
	 t4QlONqt00YPGhPjSMGPTtKY2PpF5s5t5DLax1ZYs/G8FJ5X6cxQog8CSCX3GVamrS
	 ZEfxuTI0IN1cYH6M4TsJwVjtaA7GzhItZTl1FIbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3129F8057A; Mon, 17 Jul 2023 13:45:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB15F80520;
	Mon, 17 Jul 2023 13:45:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08FDEF80571; Mon, 17 Jul 2023 13:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B50AF8047D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B50AF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GdDdvTlU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594331; x=1721130331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sl5Gsnd/CL3gcj6qWMkwkSdpO5F+uG8kVcdae82rkJA=;
  b=GdDdvTlUsSwwUEGME9fv9flf+U0FAO0ZLigdkzHMMnrhCOngTVt3c2Do
   vu52J2r7wnWywkGL7PEESlZ0yu2gI8d9+jb1I4BGgK+Cg9jGCIkpngxc9
   Dv3AUu+P2hGg//aw0wf5gWd6thP1i7OkESBhP1OHDcynuNXfy6aDnBety
   nfKKitUrP0pAS5ktjFMbe9hQh8lqXno3HojhfmH8Ewrwgh/AhPSrwoyxn
   DrSM41REukf0vpk/j7i/80G2DxQh2QQunNTTjxmKmTjcjafLq5HZ6U22B
   BVO0QZyIWqlxvDtl7toicfbfRZejPbFCXorKsjRUQ2if52NwgXKrQEMyp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363372747"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363372747"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856485"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856485"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:45:24 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 02/15] PCI: Add Intel Audio DSP devices to pci_ids.h
Date: Mon, 17 Jul 2023 13:44:58 +0200
Message-Id: <20230717114511.484999-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEW6XWTMZNKARMTJYIU7PBF4DCZ3F35Z
X-Message-ID-Hash: SEW6XWTMZNKARMTJYIU7PBF4DCZ3F35Z
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEW6XWTMZNKARMTJYIU7PBF4DCZ3F35Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Those IDs are mostly sprinkled between HDA, Skylake, SOF and avs drivers.
Almost every use contains additional comments to identify to which
platform those IDs refer to. Add those IDs to pci_ids.h header, so that
there is one place which defines those names.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # for the Intel Tangier ID
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/linux/pci_ids.h | 73 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index add7fb6bd844..3066660cd39b 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2644,6 +2644,7 @@
 
 #define PCI_VENDOR_ID_INTEL		0x8086
 #define PCI_DEVICE_ID_INTEL_EESSC	0x0008
+#define PCI_DEVICE_ID_INTEL_HDA_CML_LP	0x02c8
 #define PCI_DEVICE_ID_INTEL_PXHD_0	0x0320
 #define PCI_DEVICE_ID_INTEL_PXHD_1	0x0321
 #define PCI_DEVICE_ID_INTEL_PXH_0	0x0329
@@ -2659,8 +2660,10 @@
 #define PCI_DEVICE_ID_INTEL_82424	0x0483
 #define PCI_DEVICE_ID_INTEL_82378	0x0484
 #define PCI_DEVICE_ID_INTEL_82425	0x0486
+#define PCI_DEVICE_ID_INTEL_HDA_CML_H	0x06c8
 #define PCI_DEVICE_ID_INTEL_MRST_SD0	0x0807
 #define PCI_DEVICE_ID_INTEL_MRST_SD1	0x0808
+#define PCI_DEVICE_ID_INTEL_HDA_OAKTRAIL	0x080a
 #define PCI_DEVICE_ID_INTEL_MFD_SD	0x0820
 #define PCI_DEVICE_ID_INTEL_MFD_SDIO1	0x0821
 #define PCI_DEVICE_ID_INTEL_MFD_SDIO2	0x0822
@@ -2670,12 +2673,18 @@
 #define PCI_DEVICE_ID_INTEL_QUARK_X1000_ILB	0x095e
 #define PCI_DEVICE_ID_INTEL_I960	0x0960
 #define PCI_DEVICE_ID_INTEL_I960RM	0x0962
+#define PCI_DEVICE_ID_INTEL_HDA_HSW_0	0x0a0c
+#define PCI_DEVICE_ID_INTEL_HDA_HSW_2	0x0c0c
 #define PCI_DEVICE_ID_INTEL_CENTERTON_ILB	0x0c60
+#define PCI_DEVICE_ID_INTEL_HDA_HSW_3	0x0d0c
+#define PCI_DEVICE_ID_INTEL_HDA_BYT	0x0f04
+#define PCI_DEVICE_ID_INTEL_SST_BYT	0x0f28
 #define PCI_DEVICE_ID_INTEL_8257X_SOL	0x1062
 #define PCI_DEVICE_ID_INTEL_82573E_SOL	0x1085
 #define PCI_DEVICE_ID_INTEL_82573L_SOL	0x108f
 #define PCI_DEVICE_ID_INTEL_82815_MC	0x1130
 #define PCI_DEVICE_ID_INTEL_82815_CGC	0x1132
+#define PCI_DEVICE_ID_INTEL_SST_TNG	0x119a
 #define PCI_DEVICE_ID_INTEL_82092AA_0	0x1221
 #define PCI_DEVICE_ID_INTEL_82437	0x122d
 #define PCI_DEVICE_ID_INTEL_82371FB_0	0x122e
@@ -2702,20 +2711,26 @@
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE  0x1576
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI     0x1577
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE  0x1578
+#define PCI_DEVICE_ID_INTEL_HDA_BDW	0x160c
 #define PCI_DEVICE_ID_INTEL_80960_RP	0x1960
 #define PCI_DEVICE_ID_INTEL_QAT_C3XXX	0x19e2
 #define PCI_DEVICE_ID_INTEL_QAT_C3XXX_VF	0x19e3
 #define PCI_DEVICE_ID_INTEL_82840_HB	0x1a21
 #define PCI_DEVICE_ID_INTEL_82845_HB	0x1a30
 #define PCI_DEVICE_ID_INTEL_IOAT	0x1a38
+#define PCI_DEVICE_ID_INTEL_HDA_CPT	0x1c20
 #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MIN	0x1c41
 #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MAX	0x1c5f
+#define PCI_DEVICE_ID_INTEL_HDA_PBG	0x1d20
 #define PCI_DEVICE_ID_INTEL_PATSBURG_LPC_0	0x1d40
 #define PCI_DEVICE_ID_INTEL_PATSBURG_LPC_1	0x1d41
+#define PCI_DEVICE_ID_INTEL_HDA_PPT	0x1e20
 #define PCI_DEVICE_ID_INTEL_PANTHERPOINT_XHCI	0x1e31
 #define PCI_DEVICE_ID_INTEL_PANTHERPOINT_LPC_MIN	0x1e40
 #define PCI_DEVICE_ID_INTEL_PANTHERPOINT_LPC_MAX	0x1e5f
 #define PCI_DEVICE_ID_INTEL_VMD_201D	0x201d
+#define PCI_DEVICE_ID_INTEL_HDA_BSW	0x2284
+#define PCI_DEVICE_ID_INTEL_SST_BSW	0x22a8
 #define PCI_DEVICE_ID_INTEL_DH89XXCC_LPC_MIN	0x2310
 #define PCI_DEVICE_ID_INTEL_DH89XXCC_LPC_MAX	0x231f
 #define PCI_DEVICE_ID_INTEL_82801AA_0	0x2410
@@ -2793,12 +2808,14 @@
 #define PCI_DEVICE_ID_INTEL_ICH6_0	0x2640
 #define PCI_DEVICE_ID_INTEL_ICH6_1	0x2641
 #define PCI_DEVICE_ID_INTEL_ICH6_2	0x2642
+#define PCI_DEVICE_ID_INTEL_HDA_ICH6	0x2668
 #define PCI_DEVICE_ID_INTEL_ICH6_16	0x266a
 #define PCI_DEVICE_ID_INTEL_ICH6_17	0x266d
 #define PCI_DEVICE_ID_INTEL_ICH6_18	0x266e
 #define PCI_DEVICE_ID_INTEL_ICH6_19	0x266f
 #define PCI_DEVICE_ID_INTEL_ESB2_0	0x2670
 #define PCI_DEVICE_ID_INTEL_ESB2_14	0x2698
+#define PCI_DEVICE_ID_INTEL_HDA_ESB2	0x269a
 #define PCI_DEVICE_ID_INTEL_ESB2_17	0x269b
 #define PCI_DEVICE_ID_INTEL_ESB2_18	0x269e
 #define PCI_DEVICE_ID_INTEL_82945G_HB	0x2770
@@ -2811,6 +2828,7 @@
 #define PCI_DEVICE_ID_INTEL_ICH7_1	0x27b9
 #define PCI_DEVICE_ID_INTEL_TGP_LPC	0x27bc
 #define PCI_DEVICE_ID_INTEL_ICH7_31	0x27bd
+#define PCI_DEVICE_ID_INTEL_HDA_ICH7	0x27d8
 #define PCI_DEVICE_ID_INTEL_ICH7_17	0x27da
 #define PCI_DEVICE_ID_INTEL_ICH7_19	0x27dd
 #define PCI_DEVICE_ID_INTEL_ICH7_20	0x27de
@@ -2821,6 +2839,7 @@
 #define PCI_DEVICE_ID_INTEL_ICH8_3	0x2814
 #define PCI_DEVICE_ID_INTEL_ICH8_4	0x2815
 #define PCI_DEVICE_ID_INTEL_ICH8_5	0x283e
+#define PCI_DEVICE_ID_INTEL_HDA_ICH8	0x284b
 #define PCI_DEVICE_ID_INTEL_ICH8_6	0x2850
 #define PCI_DEVICE_ID_INTEL_VMD_28C0	0x28c0
 #define PCI_DEVICE_ID_INTEL_ICH9_0	0x2910
@@ -2832,6 +2851,8 @@
 #define PCI_DEVICE_ID_INTEL_ICH9_8	0x2918
 #define PCI_DEVICE_ID_INTEL_ICH9_5	0x2919
 #define PCI_DEVICE_ID_INTEL_ICH9_6	0x2930
+#define PCI_DEVICE_ID_INTEL_HDA_ICH9_0	0x293e
+#define PCI_DEVICE_ID_INTEL_HDA_ICH9_1	0x293f
 #define PCI_DEVICE_ID_INTEL_I7_MCR	0x2c18
 #define PCI_DEVICE_ID_INTEL_I7_MC_TAD	0x2c19
 #define PCI_DEVICE_ID_INTEL_I7_MC_RAS	0x2c1a
@@ -2883,6 +2904,7 @@
 #define PCI_DEVICE_ID_INTEL_LYNNFIELD_MC_CH2_ADDR_REV2  0x2db1
 #define PCI_DEVICE_ID_INTEL_LYNNFIELD_MC_CH2_RANK_REV2  0x2db2
 #define PCI_DEVICE_ID_INTEL_LYNNFIELD_MC_CH2_TC_REV2    0x2db3
+#define PCI_DEVICE_ID_INTEL_HDA_GML	0x3198
 #define PCI_DEVICE_ID_INTEL_82855PM_HB	0x3340
 #define PCI_DEVICE_ID_INTEL_IOAT_TBG4	0x3429
 #define PCI_DEVICE_ID_INTEL_IOAT_TBG5	0x342a
@@ -2893,6 +2915,7 @@
 #define PCI_DEVICE_ID_INTEL_IOAT_TBG1	0x3431
 #define PCI_DEVICE_ID_INTEL_IOAT_TBG2	0x3432
 #define PCI_DEVICE_ID_INTEL_IOAT_TBG3	0x3433
+#define PCI_DEVICE_ID_INTEL_HDA_ICL_LP	0x34c8
 #define PCI_DEVICE_ID_INTEL_82830_HB	0x3575
 #define PCI_DEVICE_ID_INTEL_82830_CGC	0x3577
 #define PCI_DEVICE_ID_INTEL_82855GM_HB	0x3580
@@ -2925,14 +2948,19 @@
 #define PCI_DEVICE_ID_INTEL_IOAT_JSF9	0x3719
 #define PCI_DEVICE_ID_INTEL_QAT_C62X	0x37c8
 #define PCI_DEVICE_ID_INTEL_QAT_C62X_VF	0x37c9
+#define PCI_DEVICE_ID_INTEL_HDA_ICL_N	0x38c8
 #define PCI_DEVICE_ID_INTEL_ICH10_0	0x3a14
 #define PCI_DEVICE_ID_INTEL_ICH10_1	0x3a16
 #define PCI_DEVICE_ID_INTEL_ICH10_2	0x3a18
 #define PCI_DEVICE_ID_INTEL_ICH10_3	0x3a1a
 #define PCI_DEVICE_ID_INTEL_ICH10_4	0x3a30
+#define PCI_DEVICE_ID_INTEL_HDA_ICH10_0	0x3a3e
 #define PCI_DEVICE_ID_INTEL_ICH10_5	0x3a60
+#define PCI_DEVICE_ID_INTEL_HDA_ICH10_1 0x3a6e
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_LPC_MIN	0x3b00
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_LPC_MAX	0x3b1f
+#define PCI_DEVICE_ID_INTEL_HDA_5_3400_SERIES_0	0x3b56
+#define PCI_DEVICE_ID_INTEL_HDA_5_3400_SERIES_1	0x3b57
 #define PCI_DEVICE_ID_INTEL_IOAT_SNB0	0x3c20
 #define PCI_DEVICE_ID_INTEL_IOAT_SNB1	0x3c21
 #define PCI_DEVICE_ID_INTEL_IOAT_SNB2	0x3c22
@@ -2969,12 +2997,31 @@
 #define PCI_DEVICE_ID_INTEL_SBRIDGE_SAD0	0x3cf4	/* 12.6 */
 #define PCI_DEVICE_ID_INTEL_SBRIDGE_BR		0x3cf5	/* 13.6 */
 #define PCI_DEVICE_ID_INTEL_SBRIDGE_SAD1	0x3cf6	/* 12.7 */
+#define PCI_DEVICE_ID_INTEL_HDA_ICL_H	0x3dc8
 #define PCI_DEVICE_ID_INTEL_IOAT_SNB	0x402f
 #define PCI_DEVICE_ID_INTEL_5400_ERR	0x4030
 #define PCI_DEVICE_ID_INTEL_5400_FBD0	0x4035
 #define PCI_DEVICE_ID_INTEL_5400_FBD1	0x4036
+#define PCI_DEVICE_ID_INTEL_HDA_TGL_H	0x43c8
+#define PCI_DEVICE_ID_INTEL_HDA_DG1	0x490d
+#define PCI_DEVICE_ID_INTEL_HDA_EHL_0	0x4b55
+#define PCI_DEVICE_ID_INTEL_HDA_EHL_3	0x4b58
+#define PCI_DEVICE_ID_INTEL_HDA_JSL_N	0x4dc8
+#define PCI_DEVICE_ID_INTEL_HDA_DG2_0	0x4f90
+#define PCI_DEVICE_ID_INTEL_HDA_DG2_1	0x4f91
+#define PCI_DEVICE_ID_INTEL_HDA_DG2_2	0x4f92
 #define PCI_DEVICE_ID_INTEL_EP80579_0	0x5031
 #define PCI_DEVICE_ID_INTEL_EP80579_1	0x5032
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_P	0x51c8
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_PS	0x51c9
+#define PCI_DEVICE_ID_INTEL_HDA_RPL_P_0	0x51ca
+#define PCI_DEVICE_ID_INTEL_HDA_RPL_P_1	0x51cb
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_M	0x51cc
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_PX	0x51cd
+#define PCI_DEVICE_ID_INTEL_HDA_RPL_M	0x51ce
+#define PCI_DEVICE_ID_INTEL_HDA_RPL_PX	0x51cf
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_N	0x54c8
+#define PCI_DEVICE_ID_INTEL_HDA_APL	0x5a98
 #define PCI_DEVICE_ID_INTEL_5100_16	0x65f0
 #define PCI_DEVICE_ID_INTEL_5100_19	0x65f3
 #define PCI_DEVICE_ID_INTEL_5100_21	0x65f5
@@ -3008,8 +3055,12 @@
 #define PCI_DEVICE_ID_INTEL_82443GX_0	0x71a0
 #define PCI_DEVICE_ID_INTEL_82443GX_2	0x71a2
 #define PCI_DEVICE_ID_INTEL_82372FB_1	0x7601
+#define PCI_DEVICE_ID_INTEL_HDA_RPL_S	0x7a50
+#define PCI_DEVICE_ID_INTEL_HDA_ADL_S	0x7ad0
+#define PCI_DEVICE_ID_INTEL_HDA_MTL	0x7e28
 #define PCI_DEVICE_ID_INTEL_SCH_LPC	0x8119
 #define PCI_DEVICE_ID_INTEL_SCH_IDE	0x811a
+#define PCI_DEVICE_ID_INTEL_HDA_POULSBO	0x811b
 #define PCI_DEVICE_ID_INTEL_E6XX_CU	0x8183
 #define PCI_DEVICE_ID_INTEL_ITC_LPC	0x8186
 #define PCI_DEVICE_ID_INTEL_82454GX	0x84c4
@@ -3018,9 +3069,31 @@
 #define PCI_DEVICE_ID_INTEL_82454NX     0x84cb
 #define PCI_DEVICE_ID_INTEL_84460GX	0x84ea
 #define PCI_DEVICE_ID_INTEL_IXP4XX	0x8500
+#define PCI_DEVICE_ID_INTEL_HDA_LPT	0x8c20
+#define PCI_DEVICE_ID_INTEL_HDA_9_SERIES	0x8ca0
+#define PCI_DEVICE_ID_INTEL_HDA_WBG_0	0x8d20
+#define PCI_DEVICE_ID_INTEL_HDA_WBG_1	0x8d21
 #define PCI_DEVICE_ID_INTEL_IXP2800	0x9004
+#define PCI_DEVICE_ID_INTEL_HDA_LKF	0x98c8
 #define PCI_DEVICE_ID_INTEL_VMD_9A0B	0x9a0b
+#define PCI_DEVICE_ID_INTEL_HDA_LPT_LP_0	0x9c20
+#define PCI_DEVICE_ID_INTEL_HDA_LPT_LP_1	0x9c21
+#define PCI_DEVICE_ID_INTEL_HDA_WPT_LP	0x9ca0
+#define PCI_DEVICE_ID_INTEL_HDA_SKL_LP	0x9d70
+#define PCI_DEVICE_ID_INTEL_HDA_KBL_LP	0x9d71
+#define PCI_DEVICE_ID_INTEL_HDA_CNL_LP	0x9dc8
+#define PCI_DEVICE_ID_INTEL_HDA_TGL_LP	0xa0c8
+#define PCI_DEVICE_ID_INTEL_HDA_SKL	0xa170
+#define PCI_DEVICE_ID_INTEL_HDA_KBL	0xa171
+#define PCI_DEVICE_ID_INTEL_HDA_LBG_0	0xa1f0
+#define PCI_DEVICE_ID_INTEL_HDA_LBG_1	0xa270
+#define PCI_DEVICE_ID_INTEL_HDA_KBL_H	0xa2f0
+#define PCI_DEVICE_ID_INTEL_HDA_CNL_H	0xa348
+#define PCI_DEVICE_ID_INTEL_HDA_CML_S	0xa3f0
+#define PCI_DEVICE_ID_INTEL_HDA_LNL_P	0xa828
 #define PCI_DEVICE_ID_INTEL_S21152BB	0xb152
+#define PCI_DEVICE_ID_INTEL_HDA_CML_R	0xf0c8
+#define PCI_DEVICE_ID_INTEL_HDA_RKL_S	0xf1c8
 
 #define PCI_VENDOR_ID_WANGXUN		0x8088
 
-- 
2.34.1

