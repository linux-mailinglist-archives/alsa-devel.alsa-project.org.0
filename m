Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834A7CFC2A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56DB5A4B;
	Thu, 19 Oct 2023 16:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56DB5A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724704;
	bh=cYGjC3RtWQe76PMHqH3WJV4vRZx2lL02zVDRHGAhJLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FN067P46dMqYAVJJsO+ItlWengZ0/vzkZCQb34Ddj8rgfYylUcw72ByMX9KJNiKCr
	 w1WcWpf8cQFb42sZ3c3yvbvVluZ/Fg90HFNCpeyhUb3SyKONvPd7EuaT7r4m6UkCtR
	 +x0usYN0Pzo9L/D6Br5/jsmt/ABiUF80Y6ODTicg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08874F80557; Thu, 19 Oct 2023 16:10:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24926F8055A;
	Thu, 19 Oct 2023 16:10:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0FDF8025F; Mon, 16 Oct 2023 17:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F2BEF80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2BEF80236
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id 341E31C07B1;
	Mon, 16 Oct 2023 17:55:09 +0200 (CEST)
Received: from abscue (dslb-088-078-201-093.088.078.pools.vodafone-ip.de
 [88.78.201.93])
	by srv01.abscue.de (Postfix) with ESMTPSA id 974DE1C07B0;
	Mon, 16 Oct 2023 17:55:08 +0200 (CEST)
Date: Mon, 16 Oct 2023 17:55:03 +0200
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Mark Brown <broonie@kernel.org>
Cc: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Message-ID: <ZS1c14Z+NUmlyvFx@abscue>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-2-otto.pflueger@abscue.de>
 <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AVNRHN3SE7ENBL5MBFL4FQLIWTHCI2FL
X-Message-ID-Hash: AVNRHN3SE7ENBL5MBFL4FQLIWTHCI2FL
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:09:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVNRHN3SE7ENBL5MBFL4FQLIWTHCI2FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 16, 2023 at 01:47:28PM +0100, Mark Brown wrote:
> On Sat, Oct 14, 2023 at 07:26:22PM +0200, Otto Pflüger wrote:
> 
> > +		for (i = 0; i < g_core->svc_version->num_services; i++) {
> > +			struct avcs_svc_info *info;
> > +
> > +			info = &g_core->svc_version->svc_api_info[i];
> > +			if (info->service_id != APR_SVC_ADSP_CORE)
> > +				continue;
> > +
> > +			switch (info->version) {
> > +			case AVCS_CMDRSP_Q6_ID_2_6:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_6;
> > +				break;
> > +			case AVCS_CMDRSP_Q6_ID_2_7:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_7;
> > +				break;
> > +			case AVCS_CMDRSP_Q6_ID_2_8:
> > +				core->adsp_version = Q6_ADSP_VERSION_2_8;
> > +				break;
> > +			}
> 
> This doesn't handle unknown versions at all.

The adsp_version is initialized to Q6_ADSP_VERSION_UNKNOWN in
q6core_probe, so it should stay unknown if it doesn't match any of
these values. I don't see any big problems here, but I agree that some
additional handling such as a warning message could be useful.
