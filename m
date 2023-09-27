Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0527B0931
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 17:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52144A4A;
	Wed, 27 Sep 2023 17:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52144A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695829640;
	bh=3FrmzdhTjw5LrzQOkp7joeY5gnZ08aQFmDto0Xk2RDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rLU0PwM4Ls1d/WbL/OH3Eer+doEPBZFhN/oNS5qMYgHUS+EE1uk0QM3cTL49DrJcx
	 q4zOW8/Y4rEx48MMNxdRc+l/0NS7PKxmZ/FxKODXrG28FM7CpnuG8XKcN68PSvghNY
	 CUhU3giNJctSILldfbDXBxLY7me8toKRQ4tFuebU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA10DF801D5; Wed, 27 Sep 2023 17:46:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68081F80166;
	Wed, 27 Sep 2023 17:46:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E98D5F8016A; Wed, 27 Sep 2023 17:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C28D5F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 17:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28D5F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Jdg7Mxy7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C8B561908;
	Wed, 27 Sep 2023 15:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BF3C4339A;
	Wed, 27 Sep 2023 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695829572;
	bh=3FrmzdhTjw5LrzQOkp7joeY5gnZ08aQFmDto0Xk2RDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jdg7Mxy7D4jA3i/D43lRGIJqPBosdIidu+hvsXP+OFbf9RJUra9kj9VAaMLtfVDvi
	 TuqLRrSNTNOxsuIqgQEGQ5UTKdkx+hQ1wfba6lvehEnem1vjSaVZWhwhxCct6RgvZT
	 Q+mAjxijzvfVYio8cGhCNgDjKCPl6uDErTNJjvxE=
Date: Wed, 27 Sep 2023 17:46:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 00/33] Introduce QC USB SND audio offloading support
Message-ID: <2023092752-hardcover-surviving-b9d1@gregkh>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <ZRREZl6XLzyY4K95@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRREZl6XLzyY4K95@finisterre.sirena.org.uk>
Message-ID-Hash: KKF3XJT6DJAOZ6HNQ4TMH36IRL7ISF2T
X-Message-ID-Hash: KKF3XJT6DJAOZ6HNQ4TMH36IRL7ISF2T
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKF3XJT6DJAOZ6HNQ4TMH36IRL7ISF2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 27, 2023 at 05:04:06PM +0200, Mark Brown wrote:
> On Thu, Sep 21, 2023 at 02:48:10PM -0700, Wesley Cheng wrote:
> > Several Qualcomm based chipsets can support USB audio offloading to a
> > dedicated audio DSP, which can take over issuing transfers to the USB
> > host controller.  The intention is to reduce the load on the main
> > processors in the SoC, and allow them to be placed into lower power modes.
> 
> I had a few small comments in reply to some of the patches but overall
> the ASoC sides of this look fine to me.  I didn't really look at the USB
> side at all, I'm not sure I understand it enough to have any useful
> thoughts anyway.

Thanks for reviewing those portions, I'll look at the USB bits next week
when I get back from traveling.

greg k-h
