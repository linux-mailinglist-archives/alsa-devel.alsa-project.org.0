Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A093310EF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 15:35:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE12189B;
	Mon,  8 Mar 2021 15:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE12189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615214135;
	bh=0Auu+1ynDSzh+Ku78pmvIBULVeSA/Y8XhOOjN10Tcj0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlLk8Vn1WXbpQqv5enUCPpQ/eRNNdw9EyWg0ByQiXotPbfUBqQpLh4bHBM3tYDTkc
	 uPapRJPdDpc57OR12nDXyCopO1faa9s/H306HLzW3Da3KZmUrdkmA99uYItlfHNscc
	 VU2GiayWGFXtQBKYmrEmfeEzrBBnpjGfxRGMJXug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9327FF8016C;
	Mon,  8 Mar 2021 15:34:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A9F0F80217; Mon,  8 Mar 2021 15:34:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99DDF80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 15:33:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EE1EAA0040;
 Mon,  8 Mar 2021 15:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EE1EAA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615214029; bh=xBOpSJWhEw36v2cp4f3tyeF6dQe4OVp9lWUN5qu9BqA=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=u20hX8p1xAjRSyFSV3gDrEr/20LuomykAwavYyqcZ2Ngiy/lBuFPpqHR7B/XUsIth
 l6VKa3WxTq09eNtfxpDgEqR5V2Q+jBSCyYPYGg4KUYY86Nb4flIVFwUDuQOEj8aW9g
 sm4Bk9ULoIlonAGgZJl6iPdzfW9iLj6wXbY+q2PY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  8 Mar 2021 15:33:46 +0100 (CET)
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
To: alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
Date: Mon, 8 Mar 2021 15:33:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308125817.GA212288@workstation>
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

Dne 08. 03. 21 v 13:58 Takashi Sakamoto napsal(a):
> Hi Jaroslav,
> 
> I have some concern about your commit 2cfe6addaef6[1] for alsa-lib,
> 
> It adds new library API, 'snd_ctl_elem_id_compare()', to compare a pair of
> IDs for control element. In the implementation, the API call returns 0 if
> they are the same, else negative or positive numeric value according to
> contents of the IDs.

I just noted that I didn't fill the function doc text correctly.

> 
> My concerns are:
> 
> 1. evaluation of numid field is not covered.
> 
> This is not preferable since ALSA control core implementation covers two
> types of comparison; numid only, and the combination iface, device,
> subdevice, name, and index fields. If the API is produced for general use
> cases, it should correctly handle the numid-only case, in my opinion.

My motivation was to allow to use this function for qsort() for example. The
numid and full-field comparisons are two very different things.

> 2. tri-state return value is semantically inconsistent

It's correct for the sorting (strcmp like).

> The ID structure includes three types of values; integer, enumeration, and
> string. In my opinion, tri-state return value from them has different meaning
> each other.
True, the signess is the key, the value should be ignored.

> The reason I post this message instead of posting any fix is that the fix
> to the API affects to alsa-utils, in which the API is used by a patch you
> applied a few days ago[2]. The patch also includes change to 'AM_PATH_ALSA'
> declaration in configure.ac with bumped-up version to '1.2.5', and it
> disables to rebuild alsa-utils on the latest toolchain. (alsa-lib 1.2.5 is
> not released yet.)

The latest alsa-lib in the git repo is already set to 1.2.5pre1, so if you
upgrade alsa-lib, everything should be fine. I was a bit lazy to write a
configure test and add a wrapper to alsactl to support the older alsa-lib.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
