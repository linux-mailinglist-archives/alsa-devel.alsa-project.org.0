Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BB2EF187
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 12:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43DA016E0;
	Fri,  8 Jan 2021 12:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43DA016E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610106141;
	bh=wCJYiZ5Ea8OORItaNLMjZkLzWNC3zvC9kLRyYB16Xpk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYpP+9jkOyp2IInc+zfwPQgVM/GjFzZscTce/vhc4y5qD05j8nfI7bSQeS16PQKuB
	 ZMR1OZeYWjcQnfjpUOLl01SSRPmF6p0qvpdENgfhHbpdqOiFWGYk0rQDYf2gHC+SQh
	 w3jHPh8JmF4u+S+mWh0DFxkh8w/7VouA1AibEoFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C69ACF80165;
	Fri,  8 Jan 2021 12:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E264F80166; Fri,  8 Jan 2021 12:40:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED944F800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 12:40:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 11BB9A0040;
 Fri,  8 Jan 2021 12:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 11BB9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1610106031; bh=LVgdo2oJdl5Xv4zAG00+Wp03Wd9IkhXVTQ34Cm9L3v8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Mw7KM8gGznHd8dVMhAOZyMumPcZVCutUfbBgkpkzAqBPurbhdleuR1HxOf3CiXNN+
 IBL/Kd2ovy6S8tlqtK7/NXmP/GCAMIHU2P9d/d/szQ1Dk15yAXMXWWA5bZW+bg9BRS
 fGY0Q4auX7nAxxfRvCF+JZcdbxO6IYzvFeD/9LSo=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  8 Jan 2021 12:40:28 +0100 (CET)
Subject: Re: [RFC PATCH 1/3] ALSA: control: add kcontrol_type to control
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>, alsa-devel@alsa-project.org
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
 <20210108112355.2053917-2-jaska.uimonen@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1272f71c-c736-d267-563e-c2bf43b740da@perex.cz>
Date: Fri, 8 Jan 2021 12:40:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108112355.2053917-2-jaska.uimonen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 08. 01. 21 v 12:23 Jaska Uimonen napsal(a):
> Current kcontrol structs don't have a member to describe the control
> type. The type is present in the widget which contains the control. As
> there can be many controls in one widget it is inherently presumed that
> the control types are the same.
> 
> Lately there has been use cases where different types of controls would
> be needed for single widget. Thus enable this by adding the control type
> to kcontrol and kcontrol_new structs.

It looks like a SoC only extension. Use private_data to carry this
information. It has no value for the toplevel code.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
