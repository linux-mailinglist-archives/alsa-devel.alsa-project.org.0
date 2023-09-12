Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D579D7DE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 19:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2753FAEA;
	Tue, 12 Sep 2023 19:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2753FAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694540773;
	bh=4ETaAmE+XF3QgKmb5VAd8/TjXXslOJdM7cBkt+aXyyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKFulPLanJZbMLENynowNilOT1W/NipJVTeIx7wYavem0cecfSUNBrOlbWapgGyNJ
	 7SFpbfL7JyeenircpjKbv8J8s2f6E/qE5hJaKyUSKdotdupPDAOCMy5eL7w/D23f8A
	 bdSHSF/S0fYOp2wQvR8ettUfhS79+ZDBtda6+tH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77743F8056F; Tue, 12 Sep 2023 19:44:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4EFFF8055A;
	Tue, 12 Sep 2023 19:44:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE03F80246; Tue, 12 Sep 2023 19:44:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67373F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 19:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67373F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JdM+HeE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694540660; x=1726076660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4ETaAmE+XF3QgKmb5VAd8/TjXXslOJdM7cBkt+aXyyg=;
  b=JdM+HeE7HrDe4scjOUBTnwKh7gXyIzL0wdonE8KTfvt1RTSZwhwRNAAr
   /NwiBkk2xqmCBynVnwCxQEHGJbRdkCkVmjDtW+FtniHKP4pdXuY2KjNm/
   /i1basgHn4Lgfavs3dQvMWzXCz+mjIqv8nTkU5D0nM0Ctox8MHQ+z9Lla
   Qw4Z3WOGqaS00G/R1ruH8GZwvcY+2dFbZCPFoganlGfxA9DO5UMmunJYj
   4dM+n/U0/7GrKj5DSHaugxLi+KnCjMifQ4MMtpLschzsa7iCMrBzVlQEw
   ZWjB8gEukeqf2QCUuW9qvftWXSGKBg9VaISBLVU9Q4XAUEY/hDfNjalDB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378356216"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="378356216"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 10:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809363940"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="809363940"
Received: from skotini-mobl.amr.corp.intel.com (HELO [10.209.169.137])
 ([10.209.169.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 10:44:12 -0700
Message-ID: <5a8de960-8ec4-be7b-1a60-0285f7627163@linux.intel.com>
Date: Tue, 12 Sep 2023 13:33:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: Use u8 type for link index
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 perex@perex.cz, arnd@arndb.de
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230912162617.29178-1-peter.ujfalusi@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230912162617.29178-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NZZCDOJXN6P6UPFXUNRDTJTQU2FBXQNH
X-Message-ID-Hash: NZZCDOJXN6P6UPFXUNRDTJTQU2FBXQNH
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZZCDOJXN6P6UPFXUNRDTJTQU2FBXQNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/12/23 12:26, Peter Ujfalusi wrote:
> Use consistently u8 for sdw link index. The id is limited to 4, u8 is
> adequate in size to store it.
> 
> This change will also fixes the following compiler warning/error (W=1):
> 
> sound/hda/intel-sdw-acpi.c: In function ‘sdw_intel_acpi_scan’:
> sound/hda/intel-sdw-acpi.c:34:35: error: ‘-subproperties’ directive output may be truncated writing 14 bytes into a region of size between 7 and 17 [-Werror=format-truncation=]
>    34 |                  "mipi-sdw-link-%d-subproperties", i);
>       |                                   ^~~~~~~~~~~~~~
> In function ‘is_link_enabled’,
>     inlined from ‘sdw_intel_scan_controller’ at sound/hda/intel-sdw-acpi.c:106:8,
>     inlined from ‘sdw_intel_acpi_scan’ at sound/hda/intel-sdw-acpi.c:180:9:
> sound/hda/intel-sdw-acpi.c:33:9: note: ‘snprintf’ output between 30 and 40 bytes into a destination of size 32
>    33 |         snprintf(name, sizeof(name),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    34 |                  "mipi-sdw-link-%d-subproperties", i);
>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> The warnings got brought to light by a recent patch upstream:
> commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  sound/hda/intel-sdw-acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
> index 5cb92f7ccbca..b57d72ea4503 100644
> --- a/sound/hda/intel-sdw-acpi.c
> +++ b/sound/hda/intel-sdw-acpi.c
> @@ -23,7 +23,7 @@ static int ctrl_link_mask;
>  module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
>  MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
>  
> -static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
> +static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
>  {
>  	struct fwnode_handle *link;
>  	char name[32];
> @@ -31,7 +31,7 @@ static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
>  
>  	/* Find master handle */
>  	snprintf(name, sizeof(name),
> -		 "mipi-sdw-link-%d-subproperties", i);
> +		 "mipi-sdw-link-%hhu-subproperties", idx);
>  
>  	link = fwnode_get_named_child_node(fw_node, name);
>  	if (!link)
> @@ -51,8 +51,8 @@ static int
>  sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
>  {
>  	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
> -	int ret, i;
> -	u8 count;
> +	u8 count, i;
> +	int ret;
>  
>  	if (!adev)
>  		return -EINVAL;
