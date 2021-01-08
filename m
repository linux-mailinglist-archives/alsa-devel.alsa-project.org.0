Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88182EF14F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 12:34:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C44215DC;
	Fri,  8 Jan 2021 12:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C44215DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610105647;
	bh=MES5KircxIe7cMp25yvWnpzjdKzJLlzLNR6LwXwSELM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=opK6kInjMRUTb1iWdobOUjtJWKGvv2P8B2EOo7m8f7goqh2n+NpTqfA8TzPRv1WbX
	 MemvcNYtWABh8uvnw/sMYtVz3Fo0b3bH/AVV6ntKHBpVh1wTUjD57iFGldD7fHyk0u
	 1iTumVk7vrVP+3Bp+ohutpQV4leM9RSsJXYJMYEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D9BF8025E;
	Fri,  8 Jan 2021 12:32:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8B56F80166; Fri,  8 Jan 2021 12:32:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8FD2F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 12:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8FD2F800E9
IronPort-SDR: Sflxqbm7H0NJV/j83IUXSRwyKxiJpnNPiVEXQHkVVzMl/tQAY+CB6iwlz9gGAFkK30+EWyiuZ3
 PRXRpAescHfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="157359952"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="157359952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 03:32:12 -0800
IronPort-SDR: OP/fQfkyEfWEswMzJRYIWh7GcVp+8/aa1O9y+qsHKY2qfxY2XBeUvCnQXwKBR8mLbaNfaDC2Cg
 efUwkealHB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362310489"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga002.jf.intel.com with ESMTP; 08 Jan 2021 03:32:11 -0800
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/3] Enable using multiple kcontrol types in a widget
Date: Fri,  8 Jan 2021 13:23:52 +0200
Message-Id: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Hi,

I'm requesting comments to this small series to enable multiple
different kcontrol types for a single widget.

Currently asoc allows to define and parse multiple same type kcontrols
for single widget. So you can have for example two volume controls in a
widget but not for example one byte and one enum control. I personally
had this kind of use case where I wanted to set filter coefficients with
bytes and something else with an enum in one processing widget.

I don't have that good perspective on the asoc history on this part so I
don't know is there some reason for the existing logic or is it just ok
to change it like in this series. I've been told some drivers use virtual
widget for this kind of situation, so they define two widget's (one
virtual) with separate controls, but in reality bind the controls
into the same component in lower level. Or can we just actually use
separate types in one widget?

First patch is just adding the type field to kcontrol struct. Second
patch is a refactoring to take into account the different control types
in parsing the topology. So it looks a little bit messy, but is just
actually looping through the types in the kcontrol creation. Third patch
is me using this in sof driver, so not so directly needed here. I've
tested this thing personally up from topology down till the dsp and for
me it seems to work, but as said I can't be sure if I'm breaking something
else here.

Jaska Uimonen (3):
  ALSA: control: add kcontrol_type to control
  ASoC: soc-topology: enable use of multiple control types
  ASoC: SOF: topology: use individual kcontrol types

 include/sound/control.h  |   2 +
 sound/core/control.c     |   2 +
 sound/soc/soc-topology.c | 462 ++++++++++++++++++---------------------
 sound/soc/sof/topology.c |  13 +-
 4 files changed, 230 insertions(+), 249 deletions(-)

-- 
2.24.1

