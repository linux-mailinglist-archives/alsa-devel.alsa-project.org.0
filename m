Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F42E8355
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 09:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC1A16BF;
	Fri,  1 Jan 2021 09:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC1A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609490492;
	bh=f3UKxByAEdW/JRPvHJPKheyVkmnwL0J4lXWTO9H0JGk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSC41yVH3zUZvo08VouSriYF8X279XGMCPBChLF+/QnzeDQPdZjfs9s5HTg/631gX
	 XxGlDkLioRkbNYWMU9xFL7SgcPNnbQNUhQmoiXbnK/Nd0V0gnJ0/XkBBX2JVV3yqnM
	 ho+rG51b0HkaCldTyVvpkKSEIK8XBygpH3FwDMRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3744BF801ED;
	Fri,  1 Jan 2021 09:40:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BD7CF801F5; Fri,  1 Jan 2021 06:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8202F8015F
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 06:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8202F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="YS0W2VTD"; 
 dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="Ez0ALtBe"
Message-ID: <f9e278f822e97c6698a04ab848beed279fb793dd.camel@archlinux.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-ed25519; t=1609478143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3UKxByAEdW/JRPvHJPKheyVkmnwL0J4lXWTO9H0JGk=;
 b=YS0W2VTD5mVfjWYmBIoaO52CjRgJZj/OyFhZd0KWYg/e9dMNo2Bz1wupfSSGDNlfVPeAbc
 N/Gi0KW3C3XaKLDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-rsa; t=1609478143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3UKxByAEdW/JRPvHJPKheyVkmnwL0J4lXWTO9H0JGk=;
 b=Ez0ALtBeibtZ9fBkwyxWWWa38f40Vc5lx6LtA9JO4syx4cpDPO6Z4kMLyy1KdNovHYhgDB
 g6Yzc3HFl3ZqEISqQqQcKfNvKXs9GbW9jLltnZfVX+yUFudbHbLGOPuKqkd7IUadF3CCFa
 0hN7ur8HCWt96fg+6MIHQ8jpDAWTPQ6uyt7V4H9VcYNyKG4OEjOwsAtbPZ75zYet7++HNU
 Vz/ljQQynp0k0bPeQLUUSzM3p1evxv8ePJD0IecW1Gb+iYQHnm26rNHqi7IGOjSEZVCBMl
 WEjejovAO7oFegq+ufjUYOodkOCpA6UVqlCcRQtC5g/uEzif1b7cwS2lKcK7NkKK1i/UGv
 8DROUqPLqyvKtng/XEjzs/rZH3WRDcEYh2PUCmPIvDSPV3gJ23smFKC+i2AI87sZHNNkHW
 ey7lCOjKiS1gVgM/eF4wX2ni1wH+j8VZlZfeX6Sc+jdfrwNR5Nrdf9z4FT3Q9dpHq2ohyB
 W/w7E6N0VHy3xjca5Or6FncdSnwN5meC/MooJ7yOJolXSNZqpLUTMGIZrraLa0D/v1GM61
 kDC4tSHJ05+7lvmj31TzSXLILRow4fGAC8LwuI5906pnp/8axOYcRCMEYPBqeoi3/ts6uJ
 K38TB8tqxD7UvBJUyLBxz6gIEDIDJo0XooncqD1MC3j9a3cTbzLWY=
Subject: Re: [PATCH v2] ALSA: hda/hdmi: fix silent stream for first playback
 to DP
From: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 alsa-devel@alsa-project.org,  tiwai@suse.de
Date: Fri, 01 Jan 2021 06:15:42 +0100
In-Reply-To: <20201210174445.3134104-1-kai.vehmanen@linux.intel.com>
References: <20201210174445.3134104-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
 auth=pass smtp.auth=heftig smtp.mailfrom=heftig@archlinux.org
X-Mailman-Approved-At: Fri, 01 Jan 2021 09:40:37 +0100
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>
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

On Thu, 2020-12-10 at 19:44 +0200, Kai Vehmanen wrote:
> +static void silent_stream_disable(struct hda_codec *codec,
> +                                 struct hdmi_spec_per_pin *per_pin)
> +{
> +       struct hdmi_spec *spec = codec->spec;
> +       struct hdmi_spec_per_cvt *per_cvt;
> +       int cvt_idx;
> +
> +       mutex_lock(&per_pin->lock);
> +       if (!per_pin->silent_stream)
> +               goto unlock_out;
> +
> +       codec_dbg(codec, "HDMI: disable silent stream on pin-NID=0x%x
> cvt-NID=0x%x\n",
> +                 per_pin->pin_nid, per_pin->cvt_nid);
> +
> +       cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
> +       if (cvt_idx >= 0 && cvt_idx < spec->num_cvts) {
> +               per_cvt = get_cvt(spec, cvt_idx);
> +               per_cvt->assigned = 0;
> +       }
> +
> +       per_pin->cvt_nid = 0;
> +       per_pin->silent_stream = false;
> +
> + unlock_out:
> +       mutex_unlock(&spec->pcm_lock);

Shouldn't this be `mutex_unlock(&per_pin->lock);`?

I'm experiencing deadlocks since 5.10.4, which backported this patch.



