Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4B785EEA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 19:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C32D839;
	Wed, 23 Aug 2023 19:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C32D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692812891;
	bh=9uMIxaJoA+f1mCswUy053qfE8Is5UGzcGqilm4GY5NM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=THBvPE0TzZXp3F6cl6EBcCffT77XOEwqbVzABk56aQSum2XSDDTeLKBDGciciY6u5
	 /Kpfc+3WzGdSUqO8+mgkDSuRUpVBe7TKzuQQZ5SxBtrEZZtJovVYHsDNU6krZ4NxA5
	 6w+Hzf7zzlnhf/uDL0Beyn2RP2VbYnTAioQsihgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1956CF800F5; Wed, 23 Aug 2023 19:47:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77FAFF800F5;
	Wed, 23 Aug 2023 19:47:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09976F80158; Wed, 23 Aug 2023 19:47:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB062F800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 19:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB062F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fQ6Naf33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692812828; x=1724348828;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=702DOI9/F0EF7E8resGl8hSLnCyfzAE/NKUOfE4QyjY=;
  b=fQ6Naf336MVcRDYaileleZPsJbft9lDMDpHC4l1qZvuk1KxDZuRId+/W
   L44WyYZf8EzbjYOlPvvBrJ7EuH1qJlLkJQ5Jype054NsEoybeiCKP9C34
   GoGX2Sa2hzjO8yDywlrGBcqViLAWURobT7YWnRSH2b5Fn8kBbAxNFhEMf
   +51AKeM6zOljMFwaiaDGPt0Vmuaz1qaXxxfYoOf35jvgGb1qoYEY2heX3
   NDSQivAh2DtJ1cYslbtEACLtiPXKM9PiWMc9UIuWHgsqCrmXR6Cbn6sMR
   JYJsHRsTGu5xEeJFpqeH8eAdffIN3gVZ3MzcvEYt66i8cfpsuJyUprQ7X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371645838"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="371645838"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806795905"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="806795905"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:46:41 -0700
Date: Wed, 23 Aug 2023 20:42:47 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: =?ISO-8859-2?Q?Amadeusz_S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
    Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
    tiwai@suse.com, Alsa-devel <alsa-devel@alsa-project.org>,
    pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat
 interface
In-Reply-To: <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2308231945140.3532114@eliteleevi.tm.intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
 <874jkrdr49.wl-tiwai@suse.de> <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
 <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
 <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
 <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz> <87zg2iggn5.wl-tiwai@suse.de>
 <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
 <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: 
 <alpine.DEB.2.22.394.2308232033450.3532114@eliteleevi.tm.intel.com>
Message-ID-Hash: 4A6Q6JY33CHCPTXT4JAPOPYLRRRWVXM2
X-Message-ID-Hash: 4A6Q6JY33CHCPTXT4JAPOPYLRRRWVXM2
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; CHARSET=ISO-8859-2
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4A6Q6JY33CHCPTXT4JAPOPYLRRRWVXM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 23 Aug 2023, Amadeusz S=B3awi=F1ski wrote:

> The easiest way would of course be to add specific formats like:
> S20_MSB_LE
> U20_MSB_LE
> S20_MSB_BE
> U20_MSB_BE
> S24_MSB_LE
> U24_MSB_LE
> S24_MSB_BE
> U24_MSB_BE
> and one would know used formats exactly..., although I'm sure it is
> problematic in some ways, considering HDA currently exposes S32_LE and ju=
st
> sets msbits quietly and reports it after the fact to userspace.

Not just HDA but this is basicly all drivers. And this is ok in most=20
cases. I mean with the MSB variants, applications can produce/consume data =

with full container bit width (like S32_LE) and for many usages, this will =

just work (the LSB data will be zero, or non-zero and ignored). Reporting=20
the effective msbit is really important though, as apps _should_ check the =

field and dither when needed (although mileage varies, if you look up=20
common ALSA apps, few bother to check msbit info). Anyways, this=20
information definitely needs to be exposed and made available to apps.

But right, this is a bit orthogonal to the ability to _select_ a=20
specific variant. That is currently not possible without your patchset.

Br, Kai
