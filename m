Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B538C573598
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 13:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFC81693;
	Wed, 13 Jul 2022 13:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFC81693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657712204;
	bh=EEIse5FW+hldw/PuESnguoeEJH+P/ELbUP4KX3dQoJo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhuEtb1YQNDJ02aIWXz2uI+TLrr+OyKmnaVTYn1dG7Qe4TToc8KTH3dXwmr1eBNlf
	 MNgPECHO8zsIBR5fmSuGrD0OZS4MxE2g4hNauYMKVOi+2J9sCepPszHJjLV0WRybZq
	 iVkR80LtJ5t61LPXKhDJ+PbNgO2jDn7UKPDFASEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B1FF80254;
	Wed, 13 Jul 2022 13:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA68F80249; Wed, 13 Jul 2022 13:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6436DF8012B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 13:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6436DF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657712135184772968-webhooks-bot@alsa-project.org>
References: <1657712135184772968-webhooks-bot@alsa-project.org>
Subject: snd-aloop working no more on 1.2.7.1
Message-Id: <20220713113541.8AA68F80249@alsa1.perex.cz>
Date: Wed, 13 Jul 2022 13:35:41 +0200 (CEST)
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

alsa-project/alsa-lib issue #251 was edited from tramchamploo:

```
pcm.er4s {
    # Direct hardware access
    type        hw

    # Loopback card name
    #
    # Has to match "id" in the options of the snd-aloop module
    card        "Loopback"

    # Loopback device ID
    device      0

    # Number of audio channels
    #
    # Has to match the number of channels in music player app
    # and in the CamillaDSP input configuration
    channels    2

    # Format of audio stream
    #
    # Has to match the format defined in the
    # of the CamillaDSP input configuration
    format      "FLOAT_LE"

    # Sampling-rate of audio stream
    #
    # Has to match the sampling-rate defined in the
    # CamillaDSP configuration
    rate        48000
}


ctl.er4s {
    type hw
    card "Loopback"
}
```
This is the .asoundrc I'm using, it worked before this update.
Now aplay -L doesn't show this device.
Using mpd to play to the Loopback gets `snd_pcm_hw_params() failed: Invalid argument`.

Btw, alsa should really have a detailed specification on asoundrc file. The value of the format option I specify is from a dsp project, otherwise I have no idea what to write here. And according to [https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#gaa14b7f26877a812acbb39811364177f8](snd_pcm_format_t) it's in a totally different format.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/251
Repository URL: https://github.com/alsa-project/alsa-lib
