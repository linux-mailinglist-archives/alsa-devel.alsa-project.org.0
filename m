Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E1E20C420
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 22:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C9B1679;
	Sat, 27 Jun 2020 22:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C9B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593290546;
	bh=M77RMJOrxgP2GSsRf2I5n0jcp1lbiDPx85yabVEM+Do=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgDwiICUanSmphM3fYIvL+9QTf8iKVATphT1XGhAtzxmnNwWT3fK39R+AcOUsTzyg
	 +XtHaIa1xpwPt5GUByDd/vRygQa6DTspGwHndLY4sIT2K+8uwa1zTH9kb+Q/7SqLub
	 YoEcRYz4PwSRiMfSrIHXwSTHdQBCPNyoxySsuiNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D884F80148;
	Sat, 27 Jun 2020 22:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B01F9F80234; Sat, 27 Jun 2020 22:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A6CF80157
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 22:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A6CF80157
IronPort-SDR: fqhcwXN2CaAOGXwIM+K3JgsIdfpL31S7B1GRy2rdUSv71uEbMw3jUFbu8vuyrjTmvkfClSDya1
 aQk+IOSY5Nww==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="125366815"
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="125366815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 13:40:30 -0700
IronPort-SDR: Ox1sXx1NGE8Zae9V9Lvm+vedawtW0fHhQWLk7CJCQ97Se4v0q2AI/Hmes2GcyDvh++XKHJ1GFW
 GQDr6lJeoKOg==
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="320295633"
Received: from sspancha-mobl1.amr.corp.intel.com (HELO [10.254.110.21])
 ([10.254.110.21])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 13:40:29 -0700
Subject: Re: [PATCH] ucm: Allow empty strings in "${var:...}" substitutions
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <20200627183052.97118-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e516d4d6-69bc-703a-9dc3-a7aead3c7a4c@linux.intel.com>
Date: Sat, 27 Jun 2020 15:40:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200627183052.97118-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 6/27/20 1:30 PM, Hans de Goede wrote:
> Recent ucm-conf changes introduce checks like this one in various places:
> 
> If.mspk {
>          Condition {
>                  Type String
>                  Empty "${var:MonoSpeaker}"
>          }
>          True ...
>          False ...
> }
> 
> The 'Empty "${var:MonoSpeaker}"' part can only every succeed if we do:
> 
> Define.MonoSpeaker ""
> 
> But so far that would result in an error like this one:
> 
> ALSA lib ucm_subs.c:367:(uc_mgr_get_substituted_value) variable '${var:MonoSpeaker}' is not defined in this context!
> ALSA lib main.c:983:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -22
> alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument
> 
> This commit fixes this by allowing empty values for "${var:...}"
> substitutions.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note besides the mentioned error, this also fixes similar errors I have
> been seeing on every board since alsa-ucm-conf commit d001c8de287f
> ("ucm.conf: add support for the kernel module name tree")

Well this is quite timely, I had to revert to older versions of UCM 
earlier today because of similar issues:

root@Zotac:~/alsa-lib# alsaucm -c SOF set _verb HiFi set _enadev Headphones
ALSA lib ucm_subs.c:367:(uc_mgr_get_substituted_value) variable 
'${var:V1}' is not defined in this context!
ALSA lib main.c:983:(snd_use_case_mgr_open) error: failed to import SOF 
use case configuration -22
alsaucm: error failed to open sound card SOF: Invalid argument

This error is gone with this patch + latest alsa-ucm-conf, so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>   src/ucm/ucm_subs.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/src/ucm/ucm_subs.c b/src/ucm/ucm_subs.c
> index 293426f2..a154aa51 100644
> --- a/src/ucm/ucm_subs.c
> +++ b/src/ucm/ucm_subs.c
> @@ -262,9 +262,10 @@ static char *rval_var(snd_use_case_mgr_t *uc_mgr, const char *id)
>   		goto __rval;						\
>   	}
>   
> -#define MATCH_VARIABLE2(name, id, fcn)					\
> +#define MATCH_VARIABLE2(name, id, fcn, empty_ok)			\
>   	if (strncmp((name), (id), sizeof(id) - 1) == 0) {		\
>   		idsize = sizeof(id) - 1;				\
> +		allow_empty = (empty_ok);				\
>   		fcn2 = (fcn);						\
>   		goto __match2;						\
>   	}
> @@ -314,11 +315,11 @@ __std:
>   		MATCH_VARIABLE(value, "${CardName}", rval_card_name, false);
>   		MATCH_VARIABLE(value, "${CardLongName}", rval_card_longname, false);
>   		MATCH_VARIABLE(value, "${CardComponents}", rval_card_components, true);
> -		MATCH_VARIABLE2(value, "${env:", rval_env);
> -		MATCH_VARIABLE2(value, "${sys:", rval_sysfs);
> -		MATCH_VARIABLE2(value, "${var:", rval_var);
> -		MATCH_VARIABLE2(value, "${CardNumberByName:", rval_card_number_by_name);
> -		MATCH_VARIABLE2(value, "${CardIdByName:", rval_card_id_by_name);
> +		MATCH_VARIABLE2(value, "${env:", rval_env, false);
> +		MATCH_VARIABLE2(value, "${sys:", rval_sysfs, false);
> +		MATCH_VARIABLE2(value, "${var:", rval_var, true);
> +		MATCH_VARIABLE2(value, "${CardNumberByName:", rval_card_number_by_name, false);
> +		MATCH_VARIABLE2(value, "${CardIdByName:", rval_card_id_by_name, false);
>   __merr:
>   		err = -EINVAL;
>   		tmp = strchr(value, '}');
> 
