Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4459FE19
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 17:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960BB1FE;
	Wed, 24 Aug 2022 17:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960BB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661354340;
	bh=SXbmA+MvE8N9NPeXXzy9xEhPC4k8ucs3Iv2gSHn/cFE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOY1ECtkMkfmxfeKggzCkFSkq1nCm8MhESFl9zJs9AuCkRcDn0O6jLWyKz02TDepN
	 sCTXTwKTNLCGnhAk04MpYeH9CdsMSuKE2DsCaAkr+ipSOqi2P36rKTmTXdYOQb2axo
	 IQzMEcZLmDWTAI0JZ7AHG4Xbdo8d+3wipKnHQFss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A5FF8014B;
	Wed, 24 Aug 2022 17:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7256CF804BD; Wed, 24 Aug 2022 17:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1710FF800C8
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 17:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1710FF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d0s2yRIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661354274; x=1692890274;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SXbmA+MvE8N9NPeXXzy9xEhPC4k8ucs3Iv2gSHn/cFE=;
 b=d0s2yRIpw4ENTANA8+Nc2XBaAe3mOmLX/4MGiKY5PI+2PeZNTI6tJgC5
 ENayf8nLwRxU7vHGC6nA4/Wi0uDrlPls1OfWHsmNctTiMSZmAZnsJf8yA
 gGigD7rN9sTMHjw26M4Ungld2OPsrsRXKWtEgA2fCoLkPnlHlZTxTUxPr
 UijdGjDSUa96aHcZhkDPp/IhZpiIO5a4DqJuLR1mxRG/lrPfk2jAyt4Ph
 bpthUw+kbDGy9dCEzSrEoyhksbPq5Oy/+55i+gY/jkmjAa2/wZDGLZesd
 qm6yeMTDWrpFSk95b6bUMSzsgjb27gMM4KnyZb5NM7cWM5P8LtuZFXVNG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="273744980"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="273744980"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 08:17:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="670543169"
Received: from tleistix-mobl2.ger.corp.intel.com (HELO [10.249.43.72])
 ([10.249.43.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 08:17:46 -0700
Message-ID: <fb3a66c6-a8b3-02db-4170-5d5c521165e2@linux.intel.com>
Date: Wed, 24 Aug 2022 17:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/6] sysfs: do not create empty directories if no
 attributes are present
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-kernel@vger.kernel.org
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



On 8/24/22 15:59, Greg Kroah-Hartman wrote:
> When creating an attribute group, if it is named a subdirectory is
> created and the sysfs files are placed into that subdirectory.  If no
> files are created, normally the directory would still be present, but it
> would be empty.  Clean this up by removing the directory if no files
> were successfully created in the group at all.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: new patch
> 
> Note, totally untested!  The following soundwire patches will need this,
> if a soundwire developer could test this out, it would be most
> apreciated.

Not able to see the kernel boot with this first patch. The device is
stuck with the cursor not even blinking. It seems our CI test devices
are also stuck.

This is completely beyond my comfort zone but I can run more tests to
root cause this.


> 
> fs/sysfs/group.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index eeb0e3099421..9fe0b47db47f 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -31,12 +31,14 @@ static void remove_files(struct kernfs_node *parent,
>  			kernfs_remove_by_name(parent, (*bin_attr)->attr.name);
>  }
>  
> +/* returns -ERROR if error, or >= 0 for number of files actually created */
>  static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  			kuid_t uid, kgid_t gid,
>  			const struct attribute_group *grp, int update)
>  {
>  	struct attribute *const *attr;
>  	struct bin_attribute *const *bin_attr;
> +	int files_created = 0;
>  	int error = 0, i;
>  
>  	if (grp->attrs) {
> @@ -65,6 +67,8 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  						       gid, NULL);
>  			if (unlikely(error))
>  				break;
> +
> +			files_created++;
>  		}
>  		if (error) {
>  			remove_files(parent, grp);
> @@ -95,12 +99,15 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  							   NULL);
>  			if (error)
>  				break;
> +			files_created++;
>  		}
>  		if (error)
>  			remove_files(parent, grp);
>  	}
>  exit:
> -	return error;
> +	if (error)
> +		return error;
> +	return files_created;
>  }
>  
>  
> @@ -146,10 +153,16 @@ static int internal_create_group(struct kobject *kobj, int update,
>  		kn = kobj->sd;
>  	kernfs_get(kn);
>  	error = create_files(kn, kobj, uid, gid, grp, update);
> -	if (error) {
> +	if (error <= 0) {
> +		/*
> +		 * If an error happened _OR_ if no files were created in the
> +		 * attribute group, and we have a name for this group, delete
> +		 * the name so there's not an empty directory.
> +		 */
>  		if (grp->name)
>  			kernfs_remove(kn);
> -	}
> +	} else
> +		error = 0;
>  	kernfs_put(kn);
>  
>  	if (grp->name && update)
