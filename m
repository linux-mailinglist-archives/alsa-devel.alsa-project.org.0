Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1588CC56A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 19:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE718205;
	Wed, 22 May 2024 19:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE718205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716398232;
	bh=ltdwEzyUdwM247AlLtPwXgBN+FYyqLHcmiuIV/jXykA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sl0VpPHIafgChVCVPMSWBOYJtrO5xQWqiaZDNuUmx2pNTl6MRKXVyu9C45VNGsc6k
	 nZxOf2EU21oYfSqtuoXbRO9Y+B/W9+Eya+AloJlg6n5BVFnYcD4NLmqdJOj4IVTTVV
	 xkL49c+21wJ1CJKH4erZEWatLFYuVsht3sJqzIOA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B77F800BA; Wed, 22 May 2024 19:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE5EF8026A;
	Wed, 22 May 2024 19:16:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83DB6F80051; Wed, 22 May 2024 19:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 05940F80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 19:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05940F80051
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1716397670635666847-webhooks-bot@alsa-project.org>
References: <1716397670635666847-webhooks-bot@alsa-project.org>
Subject: topology: pre-processor: Introduce extends/overrides keywords for
 classes
Message-Id: <20240522171017.83DB6F80051@alsa1.perex.cz>
Date: Wed, 22 May 2024 19:10:17 +0200 (CEST)
Message-ID-Hash: 2LRHTPU747RF7IFG6LWNCNJYAWK72WPZ
X-Message-ID-Hash: 2LRHTPU747RF7IFG6LWNCNJYAWK72WPZ
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LRHTPU747RF7IFG6LWNCNJYAWK72WPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #268 was opened from ranj063:

Add 2 new keywords for class definitions to allow new pipeline classes extend the definitions in the base class. This feature is useful for extending previous pipeline class definitions with the addition of one or more widgets without having to duplicate everything in the new class definition.

For example: Consider a pipeline class definition as below. Note that only the widgets & routes are shown here.

Class.Pipeline.mixout-gain-dai-copier-playback {
	Object.Widget {
		mixout."1" {}
		dai-copier."1" {}
		gain."1" {}
		pipeline."1" {}
	}

	Object.Base {
		!route [
			{
				source mixout.$index.1
				sink	gain.$index.1
			}
		]
	}
}

If we want to extend this pipeline with the addition of an eqiir/eqfir, the extends keyword can be used as below:

Class.Pipeline.mixout-gain-eqiir-eqfir-dai-copier-playback {
	extends "mixout-gain-dai-copier-playback"

	Object.Widget {
		eqiir.1 {}
		eqfir.1 {}
	}

	Object.Base {
		!route [
			{
				source gain.$index.1
				sink   eqiir.$index.1
			}
			{
				source eqiir.$index.1
				sink   eqfir.$index.1
			}
		]
	}
}

This allows for defining a new class without having to duplicate everything in the base class and just adding the new widgets/routes that extend the current pipeline definition in the base class. The extends keyword is useful when extending a pipeline while keeping the routes in the base class intact and adding new widgets at the end of the pipeline.

But if we want to modify an existing pipeline class while modifying the order of widgets and/or inserting new widgets, we should use the overridess keyword instead. This allows for adding new widgets to the list of widgets in the base class definition while also allowing overriding the routes to allow inserting the new widgets and reordering the widgets in the base class. For example, if we want to add a drc widget between the gain and the eqiir modules in the above class, we can do the following:

Class.Pipeline.mixout-efx-dai-copier-playback {
	overrides "mixout-gain-eqiir-eqfir-dai-copier-playback"

	Object.Widget {
		drc.1 {}
	}

	Object.Base {
		!route [
			{
				source mixout.$index.1
				sink	gain.$index.1
			}
			{
				source gain.$index.1
				sink	drc.$index.1
			}
			{
				source	drc.$index.1
				sink	eqiir.$index.1
			}
			{
				source	eqiir.$index.1
				sink	eqfir.$index.1
			}
		]
	}
}

Nore that the routess array contains all the routes in the new class definition.

Link: https://github.com/thesofproject/sof/issues/9082

Request URL   : https://github.com/alsa-project/alsa-utils/pull/268
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/268.patch
Repository URL: https://github.com/alsa-project/alsa-utils
