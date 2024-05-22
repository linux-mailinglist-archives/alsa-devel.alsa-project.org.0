Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7F8CC9C8
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 01:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 763EB828;
	Thu, 23 May 2024 01:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 763EB828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716421254;
	bh=8d/fPZqxglocV6DYmtWv8H8Ul9Ij9/BKaXk8/XR3VKs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IPrfAIuvC9asvw1YuZyjFfYkgp80OSFMx01HxU5FEgh/H7ljt1/wN6qH0jyacrfPL
	 iHHBNuigC9kqFFpWQ8lR132DE5jSG8OQ0wYIb94sWoS8oTn9m4TCINKFjKEXokdj3V
	 FYPulOoFkqQXrV5AgmdHs83TADKE0lsZJsKTQTy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 833B9F805A1; Thu, 23 May 2024 01:40:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A4FF805A8;
	Thu, 23 May 2024 01:40:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D6CF8026A; Thu, 23 May 2024 01:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC04F8016B
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 01:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC04F8016B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1716421206697678089-webhooks-bot@alsa-project.org>
References: <1716421206697678089-webhooks-bot@alsa-project.org>
Subject: topology: pre-processor: Introduce extends/overrides keywords for
 classes
Message-Id: <20240522234016.A2D6CF8026A@alsa1.perex.cz>
Date: Thu, 23 May 2024 01:40:16 +0200 (CEST)
Message-ID-Hash: OT3NNT3A4VPVOZP6NSS7OQURPF754SFT
X-Message-ID-Hash: OT3NNT3A4VPVOZP6NSS7OQURPF754SFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OT3NNT3A4VPVOZP6NSS7OQURPF754SFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #268 was edited from ranj063:

Introduce a new keyword "Subtreecopy" for extending existing conf nodes
with additional nodes. This feature is useful for extending previous
pipeline class definitions with the addition of one or more widgets
without having to duplicate everything in the new class definition.

For example: Consider a pipeline class definition as below. Note that
only the widgets & routes are shown here.

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

If we want to extend this pipeline with the addition of an eqiir/eqfir,
we can create a Subtreecopy node with type extend as follows:

Subtreecopy.mixout-gain-eqiir-eqfir-dai-copier-playback {
	source "Class.Pipeline.mixout-gain-dai-copier-playback"
	target "Class.Pipeline"
	type extend

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

But if we want to modify an existing pipeline class while modifying the
order of widgets and/or inserting new widgets, we should use the type
"override" instead. This allows for adding new widgets to the list of
widgets in the base class definition while also allowing overriding the
routes to allow inserting the new widgets and reordering the widgets in
the base class. For example, if we want to add a drc widget between the
gain and the eqiir modules in the above class, we can do the following:

Subtreecopy.mixout-efx-dai-copier-playback {
	source "Class.Pipeline.mixout-gain-eqiir-eqfir-dai-copier-playback"
	target "Class.Pipeline"
	type override

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

Note that the routes array contains all the routes in the new subtreecopy definition.

This subtreecopy feature can also be used to copy normal config blocks
without having the need to duplicate information.

For example, if all the widgets in a pipeline support the same audio
formats, we can define it as follows:

Class.Pipeline.dai-copier-eqiir-module-copier-capture {
	formats {
		num_input_audio_formats 2
		num_output_audio_formats 2

		Object.Base.input_audio_format [
			{
				in_bit_depth		32
				in_valid_bit_depth	32
			}
			{
				in_channels		4
				in_bit_depth		32
				in_valid_bit_depth	32
				in_ch_cfg	$CHANNEL_CONFIG_3_POINT_1
				in_ch_map	$CHANNEL_MAP_3_POINT_1
			}
		]

		Object.Base.output_audio_format [
			{
				out_bit_depth		32
				out_valid_bit_depth	32
			}
			{
				out_channels		4
				out_bit_depth		32
				out_valid_bit_depth	32
				out_ch_cfg	$CHANNEL_CONFIG_3_POINT_1
				out_ch_map	$CHANNEL_MAP_3_POINT_1
			}
		]
	}

	Object.Widget {
		dai-copier."1" {
			type dai_out
			num_output_pins 1

			Subtreecopy.formats {
				source "Class.Pipeline.dai-copier-eqiir-module-copier-capture.formats"
				type override
			}
		}

		eqiir."1" {
			Subtreecopy.formats {
				source "Class.Pipeline.dai-copier-eqiir-module-copier-capture.formats"
				type override
			}

			Object.Control.bytes."1" {
				IncludeByKey.DMIC0_DAI_EQIIR {
					"passthrough"		"include/components/eqiir/passthrough.conf"
					"highpass_40hz_0db"	"include/components/eqiir/highpass_40hz_0db_48khz.conf"
					"highpass_40hz_20db"	"include/components/eqiir/highpass_40hz_20db_48khz.conf"
				}
			}
		}

		module-copier."2" {
			Subtreecopy.formats {
				source "Class.Pipeline.dai-copier-eqiir-module-copier-capture.formats"
				type override
			}
		}

		pipeline."1" {
			priority	0
			lp_mode		0
		}
	}
}

The subtreecopy node in each widget ensures that the pipeline formats
are applied to all widgets without the need for duplicating them for
each widget.

Link: https://github.com/thesofproject/sof/issues/9082

Request URL   : https://github.com/alsa-project/alsa-utils/pull/268
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/268.patch
Repository URL: https://github.com/alsa-project/alsa-utils
