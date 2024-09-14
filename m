Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8091979336
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2024 21:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF949F6;
	Sat, 14 Sep 2024 21:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF949F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726341370;
	bh=TCDg6hoUXv4oc+Lmjy4by1NP/bztbgqMDFnQQQEyxh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s66rXCU+SDreldNB+KwTAmlxlgT+Gbp8HYg27kr9Unje1A9c7dC2hvAdYbF21ImX1
	 RTBDD+RYkaStv3IJ/fpG7GeTK1xBHuc5qOvwftmsOeIwrMTaWTu7qdNF+kts0xglTA
	 HlejZP8BPDLg53a3DnGhZcGHOkOzbWayLsYI5QPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF37F80518; Sat, 14 Sep 2024 21:15:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A123F805A8;
	Sat, 14 Sep 2024 21:15:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41661F801F5; Sat, 14 Sep 2024 21:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B6F3F80107
	for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2024 21:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6F3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DWH9f6/t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75567A4028B;
	Sat, 14 Sep 2024 19:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871F4C4CEC0;
	Sat, 14 Sep 2024 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726341328;
	bh=TCDg6hoUXv4oc+Lmjy4by1NP/bztbgqMDFnQQQEyxh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWH9f6/t3PNS+sUEHILEGwUFzslyY6GM84INdyU3GTrruc2kzpncb18uqUgCnt5pl
	 Nfdzbgxe4KoHk5NIMlTqlvhfwFhMCpH15nC+Ze7Cy/x9SnvMeWYhBJ7DwHJL6Lj+Ya
	 mzlevX4qQickwpkOVfq/IzFKPn/RzM4uQMK/xVfKAh/amLFxYWCXDeSGQHYuQqdc/B
	 Bru/dutMRq108kqr39jCVj/jiQ0qOZDzbhfTnEGcjgAktDFu0VzP/h6Eq/v02xW+vc
	 OaMUe5B56f2t/VJFczo/89TPOAOQaZgRc2e6Ec9OtxWe/6KKmucwxv8uJ5J0BLb9tt
	 afdj72TzZXnwg==
Date: Sun, 15 Sep 2024 00:45:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Message-ID: <ZuXgzRSPx7hN6ASO@vaman>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
 <2024091130-detail-remix-34f7@gregkh>
 <ZuQnPnRsXaUEBv6X@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuQnPnRsXaUEBv6X@vaman>
Message-ID-Hash: BGJRB7JVMIFSLH5FQO55QVYW6D5G5G72
X-Message-ID-Hash: BGJRB7JVMIFSLH5FQO55QVYW6D5G5G72
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGJRB7JVMIFSLH5FQO55QVYW6D5G5G72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13-09-24, 17:21, Vinod Koul wrote:
> On 11-09-24, 14:31, Greg KH wrote:
> > On Tue, Sep 10, 2024 at 04:02:29PM +0300, Péter Ujfalusi wrote:
> > > Hi,
> > > 
> > > On 10/09/2024 15:40, Peter Ujfalusi wrote:
> > > > The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
> > > > of ports and it is forced as 0 index based.
> > > > 
> > > > The original code was correct while the change to walk the bits and use
> > > > their position as index into the arrays is not correct.
> > > > 
> > > > For exmple we can have the prop.source_ports=0x2, which means we have one
> > > > port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
> > > > memory.
> > > > 
> > > > This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.
> > > 
> > > I just noticed that Krzysztof already sent the revert patch but it is
> > > not picked up for stable-6.10.y
> > > 
> > > https://lore.kernel.org/lkml/20240909164746.136629-1-krzysztof.kozlowski@linaro.org/
> > 
> > Is this in Linus's tree yet?  That's what we are waiting for.
> 
> Yes I was waiting for that as well, the pull request has been sent to
> Linus, this should be in his tree, hopefully tomorow..

It is in Linus's tree now. Greg would you like to drop commit
6fa78e9c41471fe43052cd6feba6eae1b0277ae3 or carry it and the
revert...?

What is the usual process for you to handle reverts?
-- 
~Vinod
