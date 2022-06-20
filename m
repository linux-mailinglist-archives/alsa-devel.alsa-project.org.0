Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4EA551481
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 11:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA1A189F;
	Mon, 20 Jun 2022 11:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA1A189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655717922;
	bh=krr41zHUDxKp6WLORy1hxD2G39jlUs83esoX9QIYIqo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUxU+NKVPdt+T3cbcH0U697nBO3a4sSaFJkHRotM3AxuIZTyJ8H9m2TjpRIEuQGkx
	 nUUqlzEEVGiY9gRKHHJt3DGyLOISVhmJDtgBSmkVnoSIItKhyWBg6NNh+xJnwjWt02
	 Qc9tM+OkaHOeVtrD2msTjKXuRlgyGwoGghhWYyJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18040F804D8;
	Mon, 20 Jun 2022 11:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CCCFF800E3; Mon, 20 Jun 2022 11:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B974CF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 11:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B974CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lCYem4Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655717855; x=1687253855;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=krr41zHUDxKp6WLORy1hxD2G39jlUs83esoX9QIYIqo=;
 b=lCYem4RlmdrONjTV/ECZkas42NkNYu0ojAySHkw2EPXgSHWAwdFpbQw5
 NmKbOP3JbNi59+HL///8EtUh36ZrR95k1jHwZ/2fA9nrqfOaufJji8rlt
 601tU0+BiyF79Q/9fCz2Y+vBUtX/ZCeYlDNU64/SNmYxzVgEyNbDTr7gv
 9C1qBotB36lKQoiT3qaeeqHxqtt/sC+PiPl8fKrr6/ESBEyjQJTKPUjuo
 Jxuefq19tldQgP9mR+BOZfzBw5cWy/jm4FWr4LubQniV+CRCJbrqsYzQ6
 Bpqufa89Qoj4/41SaGmInlBSY1udZWjNgN0bNF8c/iqFXbr/woRWYoUzf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366176162"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366176162"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:37:29 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="689370980"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:37:27 -0700
Date: Mon, 20 Jun 2022 12:26:52 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HDMI probe regression on IVB (and older?)
In-Reply-To: <87bkunztec.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2206201141320.1532214@eliteleevi.tm.intel.com>
References: <87bkunztec.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 20 Jun 2022, Takashi Iwai wrote:

> we've got a regression report about Intel HDMI.  It seems that the
> recent change to skip the component binding (commit c9db8a30d9f0)
> throws away the devices incorrectly on IvyBridge.  I guess the similar
> issue could happen on older chips.  The bug report is found at
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1200611

we'll check. We actually have IVB (and older), in the i915 CI and I can 
see the binding check working correctly there (with 5.19-rc2). But 
obviously something goes wrong in the reporter's case, so needs more 
debug.

Br, Kai
