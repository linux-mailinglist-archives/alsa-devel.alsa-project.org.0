Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCF6A1CEB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 14:21:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34148203;
	Fri, 24 Feb 2023 14:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34148203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677244918;
	bh=7ODUv3D8xf81slIDQs9GhkgTjA9Y9Xu/c56SdK+cH1A=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q71R8HxBx3qAX+yDaoUhslNcBLX7kNNKg86HbMzCbjxgtigS/Y8zI8drzKFSMbubC
	 lCZvnJU1TMCI9/QrC0kXOWrPvc7wC89pmABFZQvOV1rIXKpqfA+O4zqn9wIvUpvd67
	 iyWf4Yyrd9bWzIgeDRmtQxk+WEfEMLvGZLfTja8k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 937B5F800BA;
	Fri, 24 Feb 2023 14:21:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31AEAF80125; Fri, 24 Feb 2023 14:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8F04F800C7;
	Fri, 24 Feb 2023 14:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F04F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XZg8aBne
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677244858; x=1708780858;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7ODUv3D8xf81slIDQs9GhkgTjA9Y9Xu/c56SdK+cH1A=;
  b=XZg8aBnemT34o2AG7gsTjgxJfXs+/4Dx5xvh8k22/mF5HAGG/MoZE6xa
   PU1HHfnaQM593owOk18w9TauwvsNJWnQREPAwz2bCPI4xGS/u87Pa9x/h
   bSqvfy4vMbk38+2fQ3wST5v1hIY5UDwcQe5CQzd8UP1CAyUvSyn/8urol
   QWI7VlOV1SK93F5Etp/j2LgxVUxQlf8AwH8jFkuaKFFqBzpAWFQl+VkvH
   KzuIYlOdo/QsclMRr5ljEMBtXSrseIf77O/DohkR2mSlmtniQB20HK7iB
   6Ct5StEisn6E4PsnysVDV/qVn8ktZVKUuO+7s8ajp/eqHn50wrTUU0QfR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333477530"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000";
   d="scan'208";a="333477530"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 05:20:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741671090"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000";
   d="scan'208";a="741671090"
Received: from nderuite-mobl1.ger.corp.intel.com (HELO [10.251.215.190])
 ([10.251.215.190])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 05:20:48 -0800
Message-ID: <f258311c-cbb3-7d5b-7f7f-2034809aad57@linux.intel.com>
Date: Fri, 24 Feb 2023 15:21:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Replace fake flexible
 arrays with flexible-array member
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <Y/gyIg1qZduhigPi@work>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Y/gyIg1qZduhigPi@work>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QSONP6CUGECW6UA4EQWEEMI3BIRVYR4C
X-Message-ID-Hash: QSONP6CUGECW6UA4EQWEEMI3BIRVYR4C
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSONP6CUGECW6UA4EQWEEMI3BIRVYR4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 24/02/2023 05:42, Gustavo A. R. Silva wrote:
> Zero-length arrays as fake flexible arrays are deprecated and we are
> moving towards adopting C99 flexible-array members, instead.
> 
> Use the DECLARE_FLEX_ARRAY() helper macro to transform zero-length
> arrays in unions with flexible-array members.
> 
> Address the following warnings found with GCC-13 and
> -fstrict-flex-arrays=3 enabled:
> sound/soc/sof/ipc4-control.c:176:77: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:78:29: warning: array subscript 0 is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:80:33: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:95:53: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:96:53: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:93:53: warning: array subscript 0 is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:140:58: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:141:29: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-control.c:142:29: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-topology.c:1475:36: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> sound/soc/sof/ipc4-topology.c:1476:36: warning: array subscript i is outside array bounds of ‘struct sof_ipc4_ctrl_value_chan[0]’ [-Warray-bounds=]
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> 
> Link: https://github.com/KSPP/linux/issues/21
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/258
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  sound/soc/sof/ipc4-topology.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
> index 72529179ac22..8507171a6e4d 100644
> --- a/sound/soc/sof/ipc4-topology.h
> +++ b/sound/soc/sof/ipc4-topology.h
> @@ -266,8 +266,8 @@ struct sof_ipc4_control_data {
>  	int index;
>  
>  	union {
> -		struct sof_ipc4_ctrl_value_chan chanv[0];
> -		struct sof_abi_hdr data[0];
> +		DECLARE_FLEX_ARRAY(struct sof_ipc4_ctrl_value_chan, chanv);
> +		DECLARE_FLEX_ARRAY(struct sof_abi_hdr, data);
>  	};
>  };
>  

-- 
Péter
