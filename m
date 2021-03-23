Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7B346AA7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 22:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B22F167A;
	Tue, 23 Mar 2021 22:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B22F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616533325;
	bh=tn7ignbHe4TRFP9Jvy3F3+NDlTB63efPCr9EWGQ47qI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNpxHS9ImsF3WdopPpz0gcYMXgH0g2yQMl88wRVtxDVCaIOUG/wgfuMFf3LSZ7dEE
	 Es1u+QiyAed+n8oygB1f5ggBKQZQJ9q5zFKF6n2JxLvlWN7MNfnbRNVaZTDMb3q/aJ
	 KyXXZ45Fe4fifINu27MxNeWRpKu7Lp3WaqRhnJJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C522F8025F;
	Tue, 23 Mar 2021 22:01:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652BEF8025F; Tue, 23 Mar 2021 22:01:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 85A46F80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 22:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85A46F80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616533268324563980-webhooks-bot@alsa-project.org>
References: <1616533268324563980-webhooks-bot@alsa-project.org>
Subject: Intro and prep for Topology2.0
Message-Id: <20210323210111.652BEF8025F@alsa1.perex.cz>
Date: Tue, 23 Mar 2021 22:01:11 +0100 (CET)
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

alsa-project/alsa-lib pull request #129 was edited from ranj063:

This pull request includes the preparatory commits paving the way for introducing Topology2.0. Existing alsatplg compiler
functionality is unmodified.

An example implementation of topology with Topology2.0 can be found here:
https://github.com/thesofproject/sof/pull/3936

   **Introduction to Topology 2.0**
    -----

    Topology2.0 is a high level keyword extension on top of the existing ALSA
    conf topology format designed to:

    1) Simplify the ALSA conf topology definitions by providing high level
       "classes" so topology designers need to write less config for common
       object definitions.

    2) Allow simple reuse of objects. Define once and reuse (like M4) with
       the ability to alter objects configuration attributes from defaults.

    3) Allow data type and value verification. This is not done today and
       frequently crops up in FW bug reports.

    **Common Topology Classes**
    -----------------------

    Topology today has some common classes that are often reused throughout
    with slightly altered configurations. i.e. widgets (components),
    pipelines, dais and controls.

    Topology2.0 introduces the high level concept of reusable "class" like
    definition for a AIF_IN/AIF_OUT type object that can be used to create
    topology objects.

    **Common Topology Attributes**
    --------------------------
    Topology defines a lot of attributes per object with different types
    and constraints. Today there is no easy way to validate type or
    constraints and this can lead to many hard to find problems in FW at
    runtime.

    A new keyword "DefineAttribute" has been added to define attribute
    type, size, min value, max value, enum_values. This then allows
    alsatplg to validate each topology object attribute.

    Topology Classes define the list of attributes that they use and
    whether the attribute is mandatory, can be overridden by parent users
    or is immutable. This also helps alsatplg emit the appropriate errors
    for attribute misuse.

    **Common Topology Arguments**
    -------------------------

    Arguments are used to pass essential data needed for instantiating an
    object particularly needed for the object name. A new keyword
    "DefineArgument" has been added to define the arguments. The order in
    which the arguments are defined determines the name for the widget.
    For example, in the case of the host widget, the name would be
    constructed as "host.1.playback" where "1" is the pipeline_id argument
    value and "playback" is the direction argument value.

    **Attribute Inheritance:**
    ----------------------
    One of the key features of Topology2.0 is howthe attribute values are
    propagated from a parent object to a child object. This is accomplished
    by adding attributes/arguments with the same name for a parent and an
    object. By doing so, when creating a child object, the value for the
    common attribute is populated from the parent. If the value is provided
    in the child object instance, then it overrides the value coming from
    the parent.

    **ALSA Conf Parser**
    ----------------

    All the changes being proposed and discussed here must be 100%
    compliant with the ALSA conf parser. i.e. no syntax changes or
    changes to semantics for any existing keyword.

    It's intended that there will be NO changes to the ALSA conf parser
   and all topology building changes will be in the alsatplg compiler.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/129
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/129.patch
Repository URL: https://github.com/alsa-project/alsa-lib
