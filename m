Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E424D224
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 12:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857331689;
	Fri, 21 Aug 2020 12:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857331689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598005315;
	bh=D5bmTTRXJvkHNZCXuSmarCYlSXsHP5xPzdJn7K7IEQk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SsvcWTA6kv+BIYjZhQWCGhSRYbagFm0IXrWOaYbct3TqM6rb8JbpBwFipP2kDy93R
	 /iMYLZgzYmW9IeAyezDLp6dOazBHCL4lU914dBwsIGW+8GF0SxILsZf2XMwn5Gt99b
	 eVMIEZvMhcMU1vUJh9arb5NunlGxFZV/hHM9YBGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9466EF800D2;
	Fri, 21 Aug 2020 12:20:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9A30F80218; Fri, 21 Aug 2020 12:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D85E7F800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 12:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85E7F800D2
IronPort-SDR: bayrLLLUBWbywyLIiNMFJjfTg31qndWMYtc9PMG2UjVU9oMVvaPpNoPa1EHxqCoUzpkO8+wage
 vbJixJZUyTow==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="217043563"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="217043563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 03:19:57 -0700
IronPort-SDR: TIyUOXRvOHLFK+/YSuugmukw1zXWcobMr1AGreR+hMleQMt/MBEkjdOe1njKUiDwhs8AiFH76L
 ngnXwVsIr3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="497936458"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2020 03:19:56 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] topology: hda-dsp: Remove srcintc module from HDA DSP topology
Date: Fri, 21 Aug 2020 12:21:05 +0200
Message-Id: <20200821102105.3210-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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

The main goal of this topology is to handle every device with hda-dsp
configuration on Skylake SST driver.

The module_id value for srcintc module varies by FW branch, which makes
it impossible to have one universal topology with srcintc module for all of them.

Remove srcintc from this topology to make it truly universal.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 .../hda-dsp/skl_hda_dsp_generic-tplg.conf     | 218 +-----------------
 1 file changed, 7 insertions(+), 211 deletions(-)

diff --git a/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf b/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
index 32ba9a7..17b7af0 100644
--- a/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
+++ b/topology/hda-dsp/skl_hda_dsp_generic-tplg.conf
@@ -102,7 +102,7 @@ SectionVendorTuples."mod_type_data_size_desc" {
     }
 
     tuples."short.u16_size_desc" {
-        SKL_TKN_U16_BLOCK_SIZE "6436"
+        SKL_TKN_U16_BLOCK_SIZE "6072"
     }
 }
 
@@ -114,7 +114,7 @@ SectionVendorTuples."mod_type_data" {
     tokens "skl_tokens"
 
     tuples."byte.u8_num_mod" {
-        SKL_TKN_U8_NUM_MOD "5"
+        SKL_TKN_U8_NUM_MOD "4"
     }
 
     tuples."uuid.mod_0" {
@@ -1252,74 +1252,6 @@ SectionVendorTuples."mod_type_data" {
         SKL_TKN_U32_FMT_SAMPLE_TYPE "0"
         SKL_TKN_U32_FMT_CH_MAP "4294967056"
     }
-
-    tuples."uuid.mod_4" {
-        SKL_TKN_UUID "141, 178, 27, 230, 154, 20, 31, 76, 183, 9, 70, 130, 62, 245, 245, 174"
-    }
-
-    tuples."byte.u8_mod_type_4" {
-        SKL_TKN_MM_U8_MOD_IDX "4"
-        SKL_TKN_U8_IN_PIN_TYPE "0"
-        SKL_TKN_U8_OUT_PIN_TYPE "0"
-        SKL_TKN_U8_IN_QUEUE_COUNT "1"
-        SKL_TKN_U8_OUT_QUEUE_COUNT "1"
-        SKL_TKN_MM_U8_NUM_RES "1"
-        SKL_TKN_MM_U8_NUM_INTF "1"
-    }
-
-    tuples."word.u32_mod_type_4_res_0" {
-        SKL_TKN_MM_U32_RES_ID "0"
-        SKL_TKN_U32_MEM_PAGES "4"
-        SKL_TKN_MM_U32_CPS "100000"
-        SKL_TKN_U32_IBS "384"
-        SKL_TKN_U32_OBS "384"
-        SKL_TKN_MM_U32_DMA_SIZE "0"
-        SKL_TKN_MM_U32_CPC "10157"
-    }
-
-    tuples."word.u32_mod_type_4_res_0_input_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "0"
-        SKL_TKN_MM_U32_RES_PIN_ID "0"
-        SKL_TKN_MM_U32_PIN_BUF "384"
-    }
-
-    tuples."word.u32_mod_type_4_res_0_output_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "1"
-        SKL_TKN_MM_U32_RES_PIN_ID "0"
-        SKL_TKN_MM_U32_PIN_BUF "384"
-    }
-
-    tuples."word.u32_mod_type_4_intf_0" {
-        SKL_TKN_MM_U32_FMT_ID "0"
-        SKL_TKN_MM_U32_NUM_IN_FMT "1"
-        SKL_TKN_MM_U32_NUM_OUT_FMT "1"
-    }
-
-    tuples."word.u32_mod_type_4_intf_0_input_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "0"
-        SKL_TKN_MM_U32_INTF_PIN_ID "0"
-        SKL_TKN_U32_FMT_CH "2"
-        SKL_TKN_U32_FMT_FREQ "48000"
-        SKL_TKN_U32_FMT_BIT_DEPTH "32"
-        SKL_TKN_U32_FMT_CH_CONFIG "1"
-        SKL_TKN_U32_FMT_INTERLEAVE "0"
-        SKL_TKN_U32_FMT_SAMPLE_SIZE "32"
-        SKL_TKN_U32_FMT_SAMPLE_TYPE "0"
-        SKL_TKN_U32_FMT_CH_MAP "4294967056"
-    }
-
-    tuples."word.u32_mod_type_4_intf_0_output_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "1"
-        SKL_TKN_MM_U32_INTF_PIN_ID "0"
-        SKL_TKN_U32_FMT_CH "2"
-        SKL_TKN_U32_FMT_FREQ "48000"
-        SKL_TKN_U32_FMT_BIT_DEPTH "32"
-        SKL_TKN_U32_FMT_CH_CONFIG "1"
-        SKL_TKN_U32_FMT_INTERLEAVE "0"
-        SKL_TKN_U32_FMT_SAMPLE_SIZE "32"
-        SKL_TKN_U32_FMT_SAMPLE_TYPE "0"
-        SKL_TKN_U32_FMT_CH_MAP "4294967056"
-    }
 }
 
 SectionData."mod_type_data" {
@@ -1597,12 +1529,12 @@ SectionVendorTuples."media0_in updwmix 0" {
 
     tuples."word.out_pin_0" {
         SKL_TKN_U32_DIR_PIN_COUNT "1"
-        SKL_TKN_U32_PIN_MOD_ID "8"
+        SKL_TKN_U32_PIN_MOD_ID "0"
         SKL_TKN_U32_PIN_INST_ID "0"
     }
 
     tuples."uuid.out_pin_0" {
-        SKL_TKN_UUID "141, 178, 27, 230, 154, 20, 31, 76, 183, 9, 70, 130, 62, 245, 245, 174"
+        SKL_TKN_UUID "178, 110, 101, 57, 113, 59, 73, 64, 141, 63, 249, 44, 213, 196, 60, 9"
     }
 }
 
@@ -1623,141 +1555,6 @@ SectionWidget."media0_in updwmix 0" {
     ]
 }
 
-SectionVendorTuples."media0_in srcintc 0 num_desc" {
-    tokens "skl_tokens"
-
-    tuples."byte.u8_num_blocks" {
-        SKL_TKN_U8_NUM_BLOCKS "1"
-    }
-}
-
-SectionData."media0_in srcintc 0 num_desc" {
-    tuples "media0_in srcintc 0 num_desc"
-}
-
-SectionVendorTuples."media0_in srcintc 0_size_desc" {
-    tokens "skl_tokens"
-
-    tuples."byte.u8_block_type" {
-        SKL_TKN_U8_BLOCK_TYPE "0"
-    }
-
-    tuples."short.u16_size_desc" {
-        SKL_TKN_U16_BLOCK_SIZE "388"
-    }
-}
-
-SectionData."media0_in srcintc 0_size_desc" {
-    tuples "media0_in srcintc 0_size_desc"
-}
-
-SectionVendorTuples."media0_in srcintc 0" {
-    tokens "skl_tokens"
-
-    tuples."uuid" {
-        SKL_TKN_UUID "141, 178, 27, 230, 154, 20, 31, 76, 183, 9, 70, 130, 62, 245, 245, 174"
-    }
-
-    tuples."byte.u8_data" {
-        SKL_TKN_U8_IN_PIN_TYPE "0"
-        SKL_TKN_U8_OUT_PIN_TYPE "0"
-        SKL_TKN_U8_DYN_IN_PIN "0"
-        SKL_TKN_U8_DYN_OUT_PIN "0"
-        SKL_TKN_U8_TIME_SLOT "0"
-        SKL_TKN_U8_CORE_ID "0"
-        SKL_TKN_U8_MODULE_TYPE "3"
-        SKL_TKN_U8_CONN_TYPE "0"
-        SKL_TKN_U8_HW_CONN_TYPE "1"
-        SKL_TKN_U8_DEV_TYPE "6"
-    }
-
-    tuples."short.u16_data" {
-        SKL_TKN_U16_MOD_INST_ID "0"
-    }
-
-    tuples."word.u32_data" {
-        SKL_TKN_U32_VBUS_ID "4294967295"
-        SKL_TKN_U32_PARAMS_FIXUP "0"
-        SKL_TKN_U32_CONVERTER "0"
-        SKL_TKN_U32_PIPE_ID "0"
-        SKL_TKN_U32_PIPE_CONN_TYPE "1"
-        SKL_TKN_U32_PIPE_PRIORITY "0"
-        SKL_TKN_U32_PMODE "0"
-        SKL_TKN_U32_D0I3_CAPS "1"
-        SKL_TKN_U32_PROC_DOMAIN "1"
-        SKL_TKN_U32_PIPE_DIRECTION "0"
-        SKL_TKN_U32_NUM_CONFIGS "1"
-        SKL_TKN_U32_DMA_BUF_SIZE "2"
-    }
-
-    tuples."word._pipe_0" {
-        SKL_TKN_U32_PIPE_CONFIG_ID "0"
-        SKL_TKN_U32_PATH_MEM_PGS "8"
-    }
-
-    tuples."word._pipe_u32_cfg_in_fmt_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "0"
-        SKL_TKN_U32_CFG_FREQ "48000"
-    }
-
-    tuples."word._pipe_u8_cfg_in_fmt_0" {
-        SKL_TKN_U8_CFG_BPS "16"
-        SKL_TKN_U8_CFG_CHAN "2"
-    }
-
-    tuples."word._pipe_u32_cfg_out_fmt_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "1"
-        SKL_TKN_U32_CFG_FREQ "48000"
-    }
-
-    tuples."word._pipe_u8_cfg_out_fmt_0" {
-        SKL_TKN_U8_CFG_BPS "32"
-        SKL_TKN_U8_CFG_CHAN "2"
-    }
-
-    tuples."short.u16_pipe_mod_cfg_0" {
-        SKL_TKN_CFG_MOD_RES_ID "0"
-        SKL_TKN_CFG_MOD_FMT_ID "0"
-    }
-
-    tuples."word.in_pin_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "0"
-        SKL_TKN_U32_PIN_MOD_ID "7"
-        SKL_TKN_U32_PIN_INST_ID "0"
-    }
-
-    tuples."uuid.in_pin_0" {
-        SKL_TKN_UUID "12, 6, 248, 66, 47, 131, 191, 77, 178, 71, 81, 233, 97, 153, 123, 52"
-    }
-
-    tuples."word.out_pin_0" {
-        SKL_TKN_U32_DIR_PIN_COUNT "1"
-        SKL_TKN_U32_PIN_MOD_ID "0"
-        SKL_TKN_U32_PIN_INST_ID "0"
-    }
-
-    tuples."uuid.out_pin_0" {
-        SKL_TKN_UUID "178, 110, 101, 57, 113, 59, 73, 64, 141, 63, 249, 44, 213, 196, 60, 9"
-    }
-}
-
-SectionData."media0_in srcintc 0" {
-    tuples "media0_in srcintc 0"
-}
-
-SectionWidget."media0_in srcintc 0" {
-    index "0"
-    type "pga"
-    no_pm "true"
-    event_type "4"
-
-    data [
-        "media0_in srcintc 0 num_desc"
-        "media0_in srcintc 0_size_desc"
-        "media0_in srcintc 0"
-    ]
-}
-
 SectionVendorTuples."media0_in mi num_desc" {
     tokens "skl_tokens"
 
@@ -1857,12 +1654,12 @@ SectionVendorTuples."media0_in mi" {
 
     tuples."word.in_pin_0" {
         SKL_TKN_U32_DIR_PIN_COUNT "0"
-        SKL_TKN_U32_PIN_MOD_ID "8"
+        SKL_TKN_U32_PIN_MOD_ID "7"
         SKL_TKN_U32_PIN_INST_ID "0"
     }
 
     tuples."uuid.in_pin_0" {
-        SKL_TKN_UUID "141, 178, 27, 230, 154, 20, 31, 76, 183, 9, 70, 130, 62, 245, 245, 174"
+        SKL_TKN_UUID "12, 6, 248, 66, 47, 131, 191, 77, 178, 71, 81, 233, 97, 153, 123, 52"
     }
 
     tuples."word.out_pin_0" {
@@ -8013,8 +7810,7 @@ SectionGraph."Pipeline 1 Graph" {
     lines [
         "media0_in cpr 0, , hda-dsp-analog-playback"
         "media0_in updwmix 0, , media0_in cpr 0"
-        "media0_in srcintc 0, , media0_in updwmix 0"
-        "media0_in mi, , media0_in srcintc 0"
+        "media0_in mi, , media0_in updwmix 0"
         "codec0_out cpr 1, , codec0_out mo"
         "codec0_out, , codec0_out cpr 1"
         "media1_in cpr 2, , hda-dsp-digital-playback"
-- 
2.17.1

