Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 718F857CEE9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 17:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E6F17E9;
	Thu, 21 Jul 2022 17:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E6F17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658417377;
	bh=WZ59twi+Y234fwpfoBS9XgGliCsgnLhK4MhvmcDYmj0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K9rLdpTluyeFG6urvSMu86b5QwwJKvvLS47YtO+Rh6Qr2BxTQLPO6AuTiZUiD3HRZ
	 d6nYu4tCX+owBDK+HffOUuNlG5QBJMPOXAzhFK+km5PuIeK1lgUz7/CF6bGGTaRDys
	 rCleiwJV5xSLurJoj7XQZ+jet1QSDWeJwfRudKLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCCCF80256;
	Thu, 21 Jul 2022 17:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4703F8016D; Thu, 21 Jul 2022 17:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC3CFF80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 17:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC3CFF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EUPjPcqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658417310; x=1689953310;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WZ59twi+Y234fwpfoBS9XgGliCsgnLhK4MhvmcDYmj0=;
 b=EUPjPcqFx7ADyQ8cZnm/LNWPVYNrwHBB9RW4d4dHQE2/JK2Hc9EFUFFK
 qg/ItmKyuJvXaAhrmEbOc4zbmn9vHLZNnqMZbAR3LP4Q5BGI0HiCp3llq
 t4+bfynR1NnkjlaCyWouIfpE323Z0OQVc4Mf7XJN4PvQrAQbPGY2RuZUk
 70fzuw4H4qIaGJA6PBMP7szon30QFYc8bONZzVLk6Kcil7BFnOgtIdXIS
 fZXXzjDm0uh92z5dZuKF49asdzRrDO7WREA5vIN/NowniWMvqZbUn3YX7
 n+k9GI5IES2tSTkrdVInjDpOrnIm3AMqNWbzXGUpziOMK6n8lbYpYz0P2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="285842331"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="285842331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 08:28:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="656794382"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.149])
 ([10.99.249.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 08:28:11 -0700
Message-ID: <d8e8e5e5-001d-5f22-b22c-aaea16ed8719@linux.intel.com>
Date: Thu, 21 Jul 2022 17:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: Intel: avs: Mark avs_path_module_type_create() as
 noinline
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220720185228.3182663-1-nathan@kernel.org>
 <c00a8b5e-6def-971a-d4f2-cd65c95fe430@linux.intel.com>
 <YtllwRY6F93uYRxz@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <YtllwRY6F93uYRxz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, patches@lists.linux.dev,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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

On 7/21/2022 4:42 PM, Mark Brown wrote:
> On Thu, Jul 21, 2022 at 02:25:20PM +0200, Amadeusz Sławiński wrote:
>> On 7/20/2022 8:52 PM, Nathan Chancellor wrote:
> 
>>> This warning is also visible with allmodconfig on other architectures.
> 
>> My first question would be what clang does differently in this configuration
>> (ARM) than in all other configurations (x86, etc.) and gcc.
> 
> See above from Nathan's commit message...

Ah, missed that. Anyway, what about if we replace multiple calls to 
guid_equal with lookup table and one call in loop?

Do let me know if something like the following works and I will send it 
as a proper patch:

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 3d46dd5e5bc4..ce157a8d6552 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -449,35 +449,39 @@ static int avs_modext_create(struct avs_dev *adev, 
struct avs_path_module *mod)
         return ret;
  }

+static int avs_probe_create(struct avs_dev *adev, struct 
avs_path_module *mod)
+{
+       dev_err(adev->dev, "Probe module can't be instantiated by 
topology");
+       return -EINVAL;
+}
+
+struct avs_module_create {
+       guid_t *guid;
+       int (*create)(struct avs_dev *adev, struct avs_path_module *mod);
+};
+
+static struct avs_module_create avs_module_create[] = {
+       { &AVS_MIXIN_MOD_UUID, avs_modbase_create },
+       { &AVS_MIXOUT_MOD_UUID, avs_modbase_create },
+       { &AVS_KPBUFF_MOD_UUID, avs_modbase_create },
+       { &AVS_COPIER_MOD_UUID, avs_copier_create },
+       { &AVS_MICSEL_MOD_UUID, avs_micsel_create },
+       { &AVS_MUX_MOD_UUID, avs_mux_create },
+       { &AVS_UPDWMIX_MOD_UUID, avs_updown_mix_create },
+       { &AVS_SRCINTC_MOD_UUID, avs_src_create },
+       { &AVS_AEC_MOD_UUID, avs_aec_create },
+       { &AVS_ASRC_MOD_UUID, avs_asrc_create },
+       { &AVS_INTELWOV_MOD_UUID, avs_wov_create },
+       { &AVS_PROBE_MOD_UUID, avs_probe_create },
+};
+
  static int avs_path_module_type_create(struct avs_dev *adev, struct 
avs_path_module *mod)
  {
         const guid_t *type = &mod->template->cfg_ext->type;

-       if (guid_equal(type, &AVS_MIXIN_MOD_UUID) ||
-           guid_equal(type, &AVS_MIXOUT_MOD_UUID) ||
-           guid_equal(type, &AVS_KPBUFF_MOD_UUID))
-               return avs_modbase_create(adev, mod);
-       if (guid_equal(type, &AVS_COPIER_MOD_UUID))
-               return avs_copier_create(adev, mod);
-       if (guid_equal(type, &AVS_MICSEL_MOD_UUID))
-               return avs_micsel_create(adev, mod);
-       if (guid_equal(type, &AVS_MUX_MOD_UUID))
-               return avs_mux_create(adev, mod);
-       if (guid_equal(type, &AVS_UPDWMIX_MOD_UUID))
-               return avs_updown_mix_create(adev, mod);
-       if (guid_equal(type, &AVS_SRCINTC_MOD_UUID))
-               return avs_src_create(adev, mod);
-       if (guid_equal(type, &AVS_AEC_MOD_UUID))
-               return avs_aec_create(adev, mod);
-       if (guid_equal(type, &AVS_ASRC_MOD_UUID))
-               return avs_asrc_create(adev, mod);
-       if (guid_equal(type, &AVS_INTELWOV_MOD_UUID))
-               return avs_wov_create(adev, mod);
-
-       if (guid_equal(type, &AVS_PROBE_MOD_UUID)) {
-               dev_err(adev->dev, "Probe module can't be instantiated 
by topology");
-               return -EINVAL;
-       }
+       for (int i = 0; i < ARRAY_SIZE(avs_module_create); i++)
+               if (guid_equal(type, avs_module_create[i].guid))
+                       return avs_module_create[i].create(adev, mod);

         return avs_modext_create(adev, mod);
  }
