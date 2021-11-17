Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DEB454A60
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 16:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E71E21926;
	Wed, 17 Nov 2021 16:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E71E21926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637164588;
	bh=7Ti9RaCIxtIWWCe1U6K1n6yZehj2yhlYvUa+qqid+xw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+k1qTU5VhO+A+hlq6uqCS4do2f2ySJ+jaxMuFrhEzGzfDOhpgFt4aMwG1JlNLDGs
	 YzV5t8PHHcnOjfI0NIKYX8xSjlxh6YnrXdVyJ3XkVcVbnqN3iBycQOtFrqoELue92p
	 BE+woLfjrMgy4Tqc4bIwU0HuKX8V6VMxZ8ZQaQcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5688CF8016C;
	Wed, 17 Nov 2021 16:55:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC6DF8027D; Wed, 17 Nov 2021 16:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 938AFF8020D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 16:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 938AFF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="220858505"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="220858505"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 07:54:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="593390154"
Received: from thanhdat-mobl1.ccr.corp.intel.com (HELO [10.212.115.229])
 ([10.212.115.229])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 07:54:55 -0800
Subject: Re: [PATCH 5.16 regression fix 2/2] ASoC: Intel: soc-acpi-cht: Revert
 shrink tables using compatible IDs
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20211117151022.122286-1-hdegoede@redhat.com>
 <20211117151022.122286-2-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f6b445bf-3444-ed7f-b31a-d71dd0599927@linux.intel.com>
Date: Wed, 17 Nov 2021 09:54:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117151022.122286-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
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



On 11/17/21 9:10 AM, Hans de Goede wrote:
> Commit 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using
> compatible IDs") simplified the match tables in soc-acpi-intel-cht-match.c
> by merging identical entries using the new .comp_ids snd_soc_acpi_mach
> field to point a single entry to multiple ACPI HIDs and clearing the
> previously unique per entry .id field.
> 
> But various machine drivers from sound/soc/intel/boards rely on mach->id
> in one or more ways. For example all of the following machine-drivers
> for entries combined during the shrinking:
> sound/soc/intel/boards/bytcr_rt5640.c
> sound/soc/intel/boards/cht_bsw_rt5645.c
> sound/soc/intel/boards/bytcht_da7213.c
> 
> Do:
> 	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
> 
> Which now no longer works and some of them also do:
> 
> 	pkg_found = snd_soc_acpi_find_package_from_hid(mach->id, ...
> 
> 	if (!strncmp(snd_soc_cards[i].codec_id, mach->id, 8)) { ...
> 
> Which now also no longer works. All these calls need to be fixed before
> we can shrink the tables, so revert this change for now.
> 
> Fixes: 959ae8215a9e ("ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs")
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Brent Lu <brent.lu@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks for the patch, it's embarrassing. I must have tested the wrong
code or the wrong device...

Could we alternatively keep these tables and just copy the information
using something like this (compile-tested only)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 31f4c4f9aeea..ac0893df9c76 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -147,7 +147,7 @@ struct snd_soc_acpi_link_adr {
  */
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
-       const u8 id[ACPI_ID_LEN];
+       u8 id[ACPI_ID_LEN];
        const struct snd_soc_acpi_codecs *comp_ids;
        const u32 link_mask;
        const struct snd_soc_acpi_link_adr *links;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 2ae99b49d3f5..6b9dfa0608a3 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -20,8 +20,10 @@ static bool snd_soc_acpi_id_present(struct
snd_soc_acpi_mach *machine)

        if (comp_ids) {
                for (i = 0; i < comp_ids->num_codecs; i++) {
-                       if (acpi_dev_present(comp_ids->codecs[i], NULL, -1))
+                       if (acpi_dev_present(comp_ids->codecs[i], NULL,
-1)) {
+                               strncpy(machine->id,
comp_ids->codecs[i], ACPI_ID_LEN);
                                return true;
+                       }
                }
        }

