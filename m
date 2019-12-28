Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F212BC89
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 05:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32CB1767;
	Sat, 28 Dec 2019 05:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32CB1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577507568;
	bh=8FucFkrsIH3tBK4b99b8RtMV9eOmdveWPbhXkwlgVZk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCsG8oYvwCb+D2Qc25aqeIyqO0wWR69DT3v3WB3AuFXdhM1HxQGc0xGhQ0P28+azW
	 0NGZG+/TZZ6C+NnLStEOrRSQTWtekcuGx516W/+MSm/MZ7IZoMQLo+ctTPoXQzKj9+
	 dWRhCZpu8/O5ymgLxfcAnL80yqp4ul1EwHTr25vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD0CF80148;
	Sat, 28 Dec 2019 05:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60516F80139; Sat, 28 Dec 2019 05:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38A0F800AE
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 05:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38A0F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SwQtv5Ap"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KVhwh8Ga"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DC6D321FBC;
 Fri, 27 Dec 2019 23:30:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 27 Dec 2019 23:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PaQDAHhjXUo39+y0gVQQpanUNqe
 ZRlMvPA+pjy+L5Z4=; b=SwQtv5Ap/xgS7dZRb1ZqrJMG6l72FoMDPayXtNQ3V8z
 tjb5iFO5RFrptLfGYxx1oCYrOca4vPcKIQfdygKAL52+WkNZsfwJ5UtcoQGXClky
 8hy00ouLg1iUrFcjiyRlfK3DNomo3EWc/T458qfhJEnxl2n3ySKZGjMR+QVj0mBi
 /PYWmOnNMrA2s1sJdHNy4dipqz/nPkvBfEC0jncU5ktu6kq1SfHiDBtSLH5Hs/HD
 3YGq2UKy9Aq2tSUpkD2oOpXLuYkXqbNoZI/rCUgziIL/PPNAqGnCuNteBTspjMfm
 qCnceUmPLQ6ziQy651hBMCP0u3C0LvxXP7KdhkdejeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PaQDAH
 hjXUo39+y0gVQQpanUNqeZRlMvPA+pjy+L5Z4=; b=KVhwh8GaJrrhJ1voJRS2e+
 IMUf6FFrvE3hAsr4EmnCgSfi/PGgjnhyjgvIBxuW7b6XjkX7eLK5U146w4VM+AIr
 Yvt1o51sny8/aqgu60ZzIYJDv8jJECVGiRtFyD+tUPiZPiUYbgv+fY8H1bFaI62c
 aRvn67bXZkNlkL3PzwoEXZJ+ktSk5zU4OWryJcHVp6CbwMN5QKAK36fQxKzFbPMO
 xHI5PHrF1CbjNJ9k9wODK2/b4sDC/OGLYXvjgcyi6YzefqHAmMCBbBUitzXDtS68
 lsq+gwedKiQduEh2YLuEHfi8WPK1iRLLJDxj0gS2qP5OAlmLbCmKUHn03SFdsYXw
 ==
X-ME-Sender: <xms:fdoGXsJdU9v3Vsc-0tjVgWeb5YVsI85nWcUMXdqqYxzv-gEqACuQUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
 ertddtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:fdoGXrMy_IFcdgj9ScaA6lu-xTk0XOb86yM8hPwSZqdwjuP_fY9Lhg>
 <xmx:fdoGXi4mf3gqKxGQjKyD2EsE4xxdLU8duO4lBYzM_TtZVqpRfajb4g>
 <xmx:fdoGXl6zwRXMJdjbETF6VVKId4qO2pOd_H0H44YB-8TdmrWVsgSxFg>
 <xmx:fdoGXsBvfkGilOrc4BQqWMaXy8w5YC7KlV8eyvkyStegKuBj0Ga07g>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79BE330607D5;
 Fri, 27 Dec 2019 23:30:52 -0500 (EST)
Date: Sat, 28 Dec 2019 13:30:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191228043049.GA23459@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20191201080449.GA408@workstation>
 <b121b3eb-3bb8-7efc-d5e1-f470049899b7@perex.cz>
 <20191214165242.GA32025@workstation>
 <a63e0b6b-b1c6-3044-cbd0-7fad47b78f35@perex.cz>
 <20191222080454.GA16605@workstation>
 <7a871b7b-a36d-db9c-5b40-ccfdc2373400@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a871b7b-a36d-db9c-5b40-ccfdc2373400@perex.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Restart alsa-gi project as alsa-gobject project
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Wed, Dec 25, 2019 at 12:11:29PM +0100, Jaroslav Kysela wrote:
> > For alsa-gobject repository, I file two PRs for improvements:
> >   * https://github.com/alsa-project/alsa-gobject/pull/1
> >   * https://github.com/alsa-project/alsa-gobject/pull/2
> > 
> > I'm glad if you grant these requests and merge. Or would I
> > merge them by myself? I think that we have no concrete policy
> > to maintain the repository.
> 
> Could you keep to maintain this repository? You should have all rights set
> on github.

Thanks for your arrangement. I merged the PRs.

Well, now I'm working for userspace services to add/maintain control
elements for sound cards bound to audio and music units on IEEE 1394
bus. The services listen application's events from ALSA control character
device to control internal DSP on the units. The services are programmed
with libraries of alsa-gobject and libhinawa by Rust languages. For
this work, I generate Rust crates for these libraries by gtk-rs/gir[1].

Next year, I'd like to add repositories for the crates, listed
below:

 * alsa-gobject-rs-sys
   * sys crates for libraries in alsa-gobject
 * alsactl-rs
   * safe API crate for libalsactl0
 * alsaseq-rs
   * safe API crate for libalsaseq0

Additionally, I'll push libhinawa v2 release to GObject Introspection
team of github.com/alsa-project and corresponding Rust crates. Thus
below repositories will be added:

 * libhinawa
 * hinawa-rs-sys
   * sys crate for libhinawa2
 * hinawa-rs
   * safe API crate for libhinawa2

I'm glad if you accept my proposal for the above repositories next year.
Have a great holidays.

[1] https://github.com/gtk-rs/gir


Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
