Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9136D072
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 04:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A23B16DE;
	Wed, 28 Apr 2021 04:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A23B16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619575746;
	bh=4nQj2Mojqk1ToVWMUiTd5BbtqDak4OFiOO5nYLgZJWc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRJ2Ng/YQTywmqAbfvr5Ix8bY9+HTO3PADVerSZkeQsQFSNH3LfXSIpu5oihR0w+C
	 qw9QdOH0jRztIezmZocvAOPIs5m78ynS/eXKg6JnUM3KIuvcbJdZDpyZY7H8u2Vyb7
	 q1DhPJo0B2SEZ3GHNEswjrEF1nudPc1db0SWGeI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D68ACF80171;
	Wed, 28 Apr 2021 04:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7AACF8016C; Wed, 28 Apr 2021 04:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 169CEF80130
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 04:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 169CEF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1619575650816946030-webhooks-bot@alsa-project.org>
References: <1619575650816946030-webhooks-bot@alsa-project.org>
Subject: Intro to Topology2.0
Message-Id: <20210428020735.E7AACF8016C@alsa1.perex.cz>
Date: Wed, 28 Apr 2021 04:07:35 +0200 (CEST)
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

alsa-project/alsa-utils pull request #86 was opened from ranj063:

Add support for pre-processing Topology2.0 conf file and building the tplg binary.

An example implementation of topology with Topology2.0 can be found here:
https://github.com/thesofproject/sof/pull/3983
Introduction to Topology 2.0
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

Common Topology Classes
-----------------------

Topology today has some common classes that are often reused throughout
with slightly altered configurations. i.e. widgets (components),
pipelines, dais and controls.

Topology2.0 introduces the high level concept of reusable "class" like
definition for a AIF_IN/AIF_OUT type object that can be used to create
topology objects.

Common Topology Attributes
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

Attribute validation
-------------------------
One of the main features of Topology2.0 is the ability to add constraints to
attributes to define a set of valid values, specify min/max values etc in 
the class definition.

Attribute Inheritance
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

Request URL   : https://github.com/alsa-project/alsa-utils/pull/86
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/86.patch
Repository URL: https://github.com/alsa-project/alsa-utils
