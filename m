Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5C10E108
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Dec 2019 09:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A305A16AE;
	Sun,  1 Dec 2019 09:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A305A16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575187611;
	bh=IF8+IRNPvT0Uh1WeM9q0NC33086xpfxyL7qNJnrDiYQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B4mWIOv0cnDwiV2e2HpxvA2sy1b1ShA13VI43+uZ3eoYcWy/2/t+eTd9CbpLnK6W+
	 4bwC2tLimp5yvwnRRsUzEHZwdUBTMJ0NFk1FZuq7Mh6loXOjhhK9K+KLAP6jtOU+nf
	 h1IL4i+FPvTxJmZpzv834Ts4onagRmYAqqihmQ6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC831F80148;
	Sun,  1 Dec 2019 09:05:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19A56F80228; Sun,  1 Dec 2019 09:05:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FAFBF800B4
 for <alsa-devel@alsa-project.org>; Sun,  1 Dec 2019 09:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FAFBF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tH190XQv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uGo1XhPE"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id AE7835F4;
 Sun,  1 Dec 2019 03:04:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 01 Dec 2019 03:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm3; bh=0y0maplFhe2J/25HUABt7jpLjmUo0AX0r06aW/FewHU=; b=tH190
 XQvN5kFW9ZZ+IyI11+z0RR7XZUobhQvoy+I0Ia0+p22g7q58k7IzA87nDlSygnRt
 2Ohpj+NHmxds74PVUmCyAy47iSoY1RLZyHy5duwQMX3GuXOmVrtc/UZ+kB30Pkib
 4DWJvkqHmMTK1PXx6Rev9TOoYNkHTOqjmGBGzLDOOAKPbeKkPdj6g8HE5ucgxiWI
 z29ipmYTnuf5rxX4a3/nXicoptVesdjvwbBJLpIqY+vOCP5NikMc7frTAidXSWvu
 13PweSTpqW0kDRQXO7OXvWkhymGR4IAKxlPtXg/Kr5aiGXHUoqYQfpPpUe1uABlf
 PY36xBGGIJQgZhPLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=0y0maplFhe2J/25HUABt7jpLjmUo0
 AX0r06aW/FewHU=; b=uGo1XhPEjW1IOqsMJcoXDfIc0TSssPTsKVVHloKtgtCj9
 JMW5j03C+56IZSH91O3yDMGGc56bOQyrvHJwPgE4XPZaIFZZdVY+ViCWL2n9H8Q9
 FPXQJKcwBAySOy7vszKi80BzokcziWrMeJh2xtSLqn3VQL7JtCiI+OUtSGbAKwNM
 vMEUj0VmzmyPd5hhg0GZK8jqmoJtenZHlLTGGkiM8NpbtoUZlT5e5Dpe2+2tWme1
 1HhL+AJ4km9NNZlZhBgXitL3ywfuUB3UUnbTTRXYYEYqefn99+h0iyNkHNo/WUf3
 tjeikaLK7sqv2XKMVOV2WN2HsAtPQhQ9Z7Q6BkA5Q==
X-ME-Sender: <xms:JnTjXYaS-JQS7TA8Hqh85FUrfz6m1os74xRCc-4NPnHNMbMmralIuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejvddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggufgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehmrghinhgtohhnth
 gvgihtrdhnvgifpdhgihhthhhusgdrtghomhdpmhgrihhnlhhoohhprdhnvgifnecukfhp
 pedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrg
 hshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:JnTjXVAmEk21lkpWWUyfAoLMstzvFZu8-dq3xPETnOgNxK70gEF_JA>
 <xmx:JnTjXRra13R9JasDZD6RLjMFeWkDf_V44oXwu9wZSVOFg9zU0qqlTA>
 <xmx:JnTjXbKQygGyvTnCVnXqHJ21EJ0X1U0hVyVfUqdNuUzSO0jCc_wr1Q>
 <xmx:J3TjXZfhm0nmRJi9YukeqUbnsPVmg-0cy4NGdLhHRwxjSzFlsF0w0w>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4F1530600AD;
 Sun,  1 Dec 2019 03:04:53 -0500 (EST)
Date: Sun, 1 Dec 2019 17:04:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz
Message-ID: <20191201080449.GA408@workstation>
Mail-Followup-To: perex@perex.cz, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] Restart alsa-gi project as alsa-gobject project
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

Since Audio Mini Conference 2018, I continued to work for alsa-gi[1] in
my local to integrate toward better I/O libraries. However I realized
that its basic design includes some disadvantages to produce useful APIs.

I rethink the design and realize it better to wrap each of structures
in <sound/asound.h> simply. Then, I restart it as alsa-gobject[2].
At present, master branch includes a library, `libalsactl0` for the
most of I/O features in ALSA control interface, which is compatible with
GObject mechanism and GObject introspection.

Jaroslav, would you please delete the alsa-gi repository and fork
the master branch from my alsa-gobject repository, then apply enough
configurations to the new repository?


My repository includes four branches as well for ALSA
hwdep/rawmidi/timer/seq interfaces. The most of features in each
interface is already available via included libraries but under heavy
development.

I already start to test them with Python 3 (PyGObject) and they seem
work well. I also test them with Rust bindings generated by gtk-rs/gir[3]
tool. Near future I also publish Rust crates for further convenience.


For your interests, this Python 3 script is a sample to listen one
event from ALSA control character device. This simple program is not
terminated voluntarily or by sending UNIX signal, thus please generate
control event by alsamixer or amixer:

```
#!/usr/bin/env python3

import gi
gi.require_version('GLib', '2.0')
gi.require_version('ALSACtl', '0.0')
from gi.repository import GLib, ALSACtl

class MyCard(ALSACtl.Card):
    def __init__(self, card_id, ctx, dispatcher):
        super().__init__()
        self.open(card_id)

        self.create_source().attach(ctx)

        self.__dispatcher = dispatcher

    def do_handle_disconnection(self):
        self.__dispatcher.quit()

    def do_handle_elem_event(self, elem_id, events):
        # Print the first event and quit event loop.
        print(elem_id.get_iface().value_nick,
              elem_id.get_device_id(), elem_id.get_subdevice_id(),
              elem_id.get_name(), elem_id.get_index(),
              events.value_nicks)
        self.__dispatcher.quit()


ctx = GLib.MainContext.new()
dispatcher = GLib.MainLoop.new(ctx, False)
card = MyCard(0, ctx, dispatcher)

dispatcher.run()
```

[1] https://github.com/alsa-project/alsa-gi
[2] https://github.com/takaswie/alsa-gobject
[3] https://github.com/gtk-rs/gir


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
