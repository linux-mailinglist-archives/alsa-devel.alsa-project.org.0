Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C574F4ED
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 18:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2CDDEE4;
	Tue, 11 Jul 2023 18:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2CDDEE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689092363;
	bh=57IXIXZsL8xEiMjjGh4XkMD07LgYqCnbZ0VLxRaY/WQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jWlw/coZbcIhcJTplHrLSTt7DA0NbtO6cXnyybia4ltw+7gPKR94dTSpMz4V4GASE
	 DgzucmNUXlcRuZvFi04NcOwA/9wvUde76WhrFN4vfYdxZR3NGayOJK+0fmgE/VhgyG
	 WSQE62dj9S0KXwZWsqtxS/c8snBhaXoW8xjAo9r8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C871F8024E; Tue, 11 Jul 2023 18:18:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9ABFF80093;
	Tue, 11 Jul 2023 18:18:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAEBFF80249; Tue, 11 Jul 2023 18:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90FEAF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 18:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90FEAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ddrQZIcX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D01561554;
	Tue, 11 Jul 2023 16:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721D9C433C9;
	Tue, 11 Jul 2023 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689092279;
	bh=57IXIXZsL8xEiMjjGh4XkMD07LgYqCnbZ0VLxRaY/WQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ddrQZIcXuzs+BaF3VtaNVCK0O4foHSi1sHFsREIYXddXf5mrdN4SpfkMvG2tJh+jv
	 RyMtWGw7ndoPf58so3PLA+Z/NeYWoFEuGCknF9jsGn1M32R1DtND/U/+q/LfgTM0SW
	 oLVni8TPIPmY+NCqSj+4i1gxuWOrbNV5xrS2EYKwK14VbuK7pzVh48o7CK3y+7v2lk
	 R9a5lLmgpLV7JoiScfMX2MeV6bcIZdAOgCttsL243cNhycfvwxuByDYcL2U/FFDI8E
	 /QpN7cta3NwYzne7+6VNjK+UlZ41CQgg3Q5sxd8LQAXM29Fr5Ir/FmNvZKkHj85RmY
	 vFrb/R8fMvhEg==
Date: Tue, 11 Jul 2023 11:17:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/13] PCI: Sort Intel PCI IDs by number
Message-ID: <20230711161757.GA250552@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711125726.3509391-2-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: XFRZ4OPX3UK3TBSX4UWZJ55FOUFAXEFD
X-Message-ID-Hash: XFRZ4OPX3UK3TBSX4UWZJ55FOUFAXEFD
X-MailFrom: helgaas@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFRZ4OPX3UK3TBSX4UWZJ55FOUFAXEFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:57:14PM +0200, Amadeusz Sławiński wrote:
> Some of the PCI IDs are not sorted correctly, reorder them by growing ID
> number.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  include/linux/pci_ids.h | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 2dc75df1437f..add7fb6bd844 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2677,8 +2677,6 @@
>  #define PCI_DEVICE_ID_INTEL_82815_MC	0x1130
>  #define PCI_DEVICE_ID_INTEL_82815_CGC	0x1132
>  #define PCI_DEVICE_ID_INTEL_82092AA_0	0x1221
> -#define PCI_DEVICE_ID_INTEL_7505_0	0x2550
> -#define PCI_DEVICE_ID_INTEL_7205_0	0x255d
>  #define PCI_DEVICE_ID_INTEL_82437	0x122d
>  #define PCI_DEVICE_ID_INTEL_82371FB_0	0x122e
>  #define PCI_DEVICE_ID_INTEL_82371FB_1	0x1230
> @@ -2772,6 +2770,8 @@
>  #define PCI_DEVICE_ID_INTEL_82850_HB	0x2530
>  #define PCI_DEVICE_ID_INTEL_82860_HB	0x2531
>  #define PCI_DEVICE_ID_INTEL_E7501_MCH	0x254c
> +#define PCI_DEVICE_ID_INTEL_7505_0	0x2550
> +#define PCI_DEVICE_ID_INTEL_7205_0	0x255d
>  #define PCI_DEVICE_ID_INTEL_82845G_HB	0x2560
>  #define PCI_DEVICE_ID_INTEL_82845G_IG	0x2562
>  #define PCI_DEVICE_ID_INTEL_82865_HB	0x2570
> @@ -2806,9 +2806,9 @@
>  #define PCI_DEVICE_ID_INTEL_3000_HB	0x2778
>  #define PCI_DEVICE_ID_INTEL_82945GM_HB	0x27a0
>  #define PCI_DEVICE_ID_INTEL_82945GM_IG	0x27a2
> +#define PCI_DEVICE_ID_INTEL_ICH7_30	0x27b0
>  #define PCI_DEVICE_ID_INTEL_ICH7_0	0x27b8
>  #define PCI_DEVICE_ID_INTEL_ICH7_1	0x27b9
> -#define PCI_DEVICE_ID_INTEL_ICH7_30	0x27b0
>  #define PCI_DEVICE_ID_INTEL_TGP_LPC	0x27bc
>  #define PCI_DEVICE_ID_INTEL_ICH7_31	0x27bd
>  #define PCI_DEVICE_ID_INTEL_ICH7_17	0x27da
> @@ -2824,14 +2824,14 @@
>  #define PCI_DEVICE_ID_INTEL_ICH8_6	0x2850
>  #define PCI_DEVICE_ID_INTEL_VMD_28C0	0x28c0
>  #define PCI_DEVICE_ID_INTEL_ICH9_0	0x2910
> -#define PCI_DEVICE_ID_INTEL_ICH9_1	0x2917
>  #define PCI_DEVICE_ID_INTEL_ICH9_2	0x2912
>  #define PCI_DEVICE_ID_INTEL_ICH9_3	0x2913
>  #define PCI_DEVICE_ID_INTEL_ICH9_4	0x2914
> -#define PCI_DEVICE_ID_INTEL_ICH9_5	0x2919
> -#define PCI_DEVICE_ID_INTEL_ICH9_6	0x2930
>  #define PCI_DEVICE_ID_INTEL_ICH9_7	0x2916
> +#define PCI_DEVICE_ID_INTEL_ICH9_1	0x2917
>  #define PCI_DEVICE_ID_INTEL_ICH9_8	0x2918
> +#define PCI_DEVICE_ID_INTEL_ICH9_5	0x2919
> +#define PCI_DEVICE_ID_INTEL_ICH9_6	0x2930
>  #define PCI_DEVICE_ID_INTEL_I7_MCR	0x2c18
>  #define PCI_DEVICE_ID_INTEL_I7_MC_TAD	0x2c19
>  #define PCI_DEVICE_ID_INTEL_I7_MC_RAS	0x2c1a
> @@ -2848,8 +2848,8 @@
>  #define PCI_DEVICE_ID_INTEL_I7_MC_CH2_ADDR  0x2c31
>  #define PCI_DEVICE_ID_INTEL_I7_MC_CH2_RANK  0x2c32
>  #define PCI_DEVICE_ID_INTEL_I7_MC_CH2_TC    0x2c33
> -#define PCI_DEVICE_ID_INTEL_I7_NONCORE	0x2c41
>  #define PCI_DEVICE_ID_INTEL_I7_NONCORE_ALT 0x2c40
> +#define PCI_DEVICE_ID_INTEL_I7_NONCORE	0x2c41
>  #define PCI_DEVICE_ID_INTEL_LYNNFIELD_NONCORE     0x2c50
>  #define PCI_DEVICE_ID_INTEL_LYNNFIELD_NONCORE_ALT 0x2c51
>  #define PCI_DEVICE_ID_INTEL_LYNNFIELD_NONCORE_REV2 0x2c70
> @@ -2895,10 +2895,10 @@
>  #define PCI_DEVICE_ID_INTEL_IOAT_TBG3	0x3433
>  #define PCI_DEVICE_ID_INTEL_82830_HB	0x3575
>  #define PCI_DEVICE_ID_INTEL_82830_CGC	0x3577
> -#define PCI_DEVICE_ID_INTEL_82854_HB	0x358c
> -#define PCI_DEVICE_ID_INTEL_82854_IG	0x358e
>  #define PCI_DEVICE_ID_INTEL_82855GM_HB	0x3580
>  #define PCI_DEVICE_ID_INTEL_82855GM_IG	0x3582
> +#define PCI_DEVICE_ID_INTEL_82854_HB	0x358c
> +#define PCI_DEVICE_ID_INTEL_82854_IG	0x358e
>  #define PCI_DEVICE_ID_INTEL_E7520_MCH	0x3590
>  #define PCI_DEVICE_ID_INTEL_E7320_MCH	0x3592
>  #define PCI_DEVICE_ID_INTEL_MCH_PA	0x3595
> @@ -2908,11 +2908,11 @@
>  #define PCI_DEVICE_ID_INTEL_MCH_PC	0x3599
>  #define PCI_DEVICE_ID_INTEL_MCH_PC1	0x359a
>  #define PCI_DEVICE_ID_INTEL_E7525_MCH	0x359e
> +#define PCI_DEVICE_ID_INTEL_IOAT_CNB	0x360b
> +#define PCI_DEVICE_ID_INTEL_FBD_CNB	0x360c
>  #define PCI_DEVICE_ID_INTEL_I7300_MCH_ERR 0x360c
>  #define PCI_DEVICE_ID_INTEL_I7300_MCH_FB0 0x360f
>  #define PCI_DEVICE_ID_INTEL_I7300_MCH_FB1 0x3610
> -#define PCI_DEVICE_ID_INTEL_IOAT_CNB	0x360b
> -#define PCI_DEVICE_ID_INTEL_FBD_CNB	0x360c
>  #define PCI_DEVICE_ID_INTEL_IOAT_JSF0	0x3710
>  #define PCI_DEVICE_ID_INTEL_IOAT_JSF1	0x3711
>  #define PCI_DEVICE_ID_INTEL_IOAT_JSF2	0x3712
> @@ -2943,16 +2943,12 @@
>  #define PCI_DEVICE_ID_INTEL_IOAT_SNB7	0x3c27
>  #define PCI_DEVICE_ID_INTEL_IOAT_SNB8	0x3c2e
>  #define PCI_DEVICE_ID_INTEL_IOAT_SNB9	0x3c2f
> -#define PCI_DEVICE_ID_INTEL_UNC_HA	0x3c46
> -#define PCI_DEVICE_ID_INTEL_UNC_IMC0	0x3cb0
> -#define PCI_DEVICE_ID_INTEL_UNC_IMC1	0x3cb1
> -#define PCI_DEVICE_ID_INTEL_UNC_IMC2	0x3cb4
> -#define PCI_DEVICE_ID_INTEL_UNC_IMC3	0x3cb5
>  #define PCI_DEVICE_ID_INTEL_UNC_QPI0	0x3c41
>  #define PCI_DEVICE_ID_INTEL_UNC_QPI1	0x3c42
>  #define PCI_DEVICE_ID_INTEL_UNC_R2PCIE	0x3c43
>  #define PCI_DEVICE_ID_INTEL_UNC_R3QPI0	0x3c44
>  #define PCI_DEVICE_ID_INTEL_UNC_R3QPI1	0x3c45
> +#define PCI_DEVICE_ID_INTEL_UNC_HA	0x3c46
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_RAS	0x3c71	/* 15.1 */
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_ERR0	0x3c72	/* 16.2 */
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_ERR1	0x3c73	/* 16.3 */
> @@ -2964,6 +2960,10 @@
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_TAD1	0x3cab	/* 15.3 */
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_TAD2	0x3cac	/* 15.4 */
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_TAD3	0x3cad	/* 15.5 */
> +#define PCI_DEVICE_ID_INTEL_UNC_IMC0	0x3cb0
> +#define PCI_DEVICE_ID_INTEL_UNC_IMC1	0x3cb1
> +#define PCI_DEVICE_ID_INTEL_UNC_IMC2	0x3cb4
> +#define PCI_DEVICE_ID_INTEL_UNC_IMC3	0x3cb5
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_IMC_DDRIO	0x3cb8	/* 17.0 */
>  #define PCI_DEVICE_ID_INTEL_JAKETOWN_UBOX	0x3ce0
>  #define PCI_DEVICE_ID_INTEL_SBRIDGE_SAD0	0x3cf4	/* 12.6 */
> -- 
> 2.34.1
> 
