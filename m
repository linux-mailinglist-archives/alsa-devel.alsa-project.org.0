Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E360FD39
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 18:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A8D165D;
	Thu, 27 Oct 2022 18:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A8D165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666888570;
	bh=ReW4mTL/Qrx5Ie4wYNRyXd3fjjAfU0EotIXdjdbjQJo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEYxDxbvy56Q0U5LQC1EPyBkwYifeLk28sTztysVomc5OgXORe34+EiflNsFagqMm
	 4NbtiEDYwf7RGn2y2yzrwC4mWeF/8bAQcAsyAE1yOrvPy5DJmYIaPAS0w71me8a752
	 WLGYOJw6Aw9GtG9KluwRSyUMzsLpusYMG/5yB+5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF63EF8016C;
	Thu, 27 Oct 2022 18:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6E5F8025E; Thu, 27 Oct 2022 18:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4278F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 18:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4278F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RmCuHfTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666888509; x=1698424509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ReW4mTL/Qrx5Ie4wYNRyXd3fjjAfU0EotIXdjdbjQJo=;
 b=RmCuHfTBcp0ZavFIOVaT+NmqCLWdgwt5dd55jplU7NJogxYOuKJKPpUr
 ZuChgIDBlmO/mKlQgySlPZiOmGF/Po4DuJCAGa0H77AVmXQb76L/mDNI+
 WFUw0xYKSnbPkPwgWEpvCE/zPN3kwGtwslGG5zgQUMr3udIK8w/OV6zf7
 IvKk9x17E9v+ZwGvAJi+sgAxbNhu8YObyFMB8WhUPH55GG/wBRv5e4EfS
 KKH+e60X7I2CqFaxAJwpjDLB/N42HtVDRCva8KK6GqGv8v4qJnI/pqKBr
 ij9KgMaEhTsLH7iZwhyr95kllQQWEtn4w7M8xCdf6qnVytLpprigQnVnP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="305885959"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="305885959"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 09:34:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="807513294"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="807513294"
Received: from djohn1-mobl1.amr.corp.intel.com (HELO [10.212.54.86])
 ([10.212.54.86])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 09:34:46 -0700
Message-ID: <f8fd25fc-a866-fcee-8bd3-9281bb328900@linux.intel.com>
Date: Thu, 27 Oct 2022 12:34:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [BUG][v6.1-rc2] [SOF] max98373 i2c-MX98373:00: Runtime PM usage
 count underflow!
To: Lukasz Majczak <lma@semihalf.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <CAFJ_xbqwaOQ+NVbVuT-TqTJ5fcp6fvVfaUxxwLW1FLZDCjrAxQ@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAFJ_xbqwaOQ+NVbVuT-TqTJ5fcp6fvVfaUxxwLW1FLZDCjrAxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Curtis Malainey <cujomalainey@google.com>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>
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



On 10/27/22 12:12, Lukasz Majczak wrote:
> Hi,
> 
> I have noticed Runtime PM usage count underflow on my Chromebook (12th
> Gen Intel(R) Core(TM) i3-1215U) running vanilla v6.1-rc2:
> 
> [    7.558178] max98373 i2c-MX98373:00: Runtime PM usage count underflow!
> [    7.558188] max98373 i2c-MX98373:01: Runtime PM usage count underflow!
> [    7.558206] snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!
> [    7.558421] snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!
> 
> Link to the full dmesg:
> https://gist.github.com/semihalf-majczak-lukasz/d6a6d61d5937f762a524ed50fed93f25

You need to apply this:

[PATCH] Revert "ASoC: soc-component: using pm_runtime_resume_and_get
instead of pm_runtime_get_sync"
